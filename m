Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CEE2556E
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 18:21:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E695C7BF9A
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 16:21:54 +0000 (UTC)
Received: from avon.wwwdotorg.org (avon.wwwdotorg.org [104.237.132.123])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9623DC7BF98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 16:21:52 +0000 (UTC)
Received: from [10.20.204.51] (unknown [216.228.112.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by avon.wwwdotorg.org (Postfix) with ESMTPSA id 6229B1C0158;
 Tue, 21 May 2019 10:21:50 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
To: Patrick Delaunay <patrick.delaunay@st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <1558357207-7345-5-git-send-email-patrick.delaunay@st.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <ac06f0cd-27cf-5878-f8f6-b2bcc5570e05@wwwdotorg.org>
Date: Tue, 21 May 2019 10:21:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558357207-7345-5-git-send-email-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Stephen Warren <swarren@nvidia.com>,
 Igor Opaniuk <igor.opaniuk@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 4/8] test: py: add option to
 select device tree used during compilation
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 5/20/19 7:00 AM, Patrick Delaunay wrote:
> Only used for spl compilation which include the device tree
> (with platdata or embedded device tree).
> For U-boot, test use config.dtb, by default :
>     "build_dir + '/arch/sandbox/dts/test.dtb'"
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> I need to force o_dt = 'all' to avoid make error:
> 
> make: *** empty string invalid as file name.  Stop.
> 
> But, I don't sure that it is the better solution for pytest.

This feels a bit odd. What board are you compiling for? I would expect 
the same compilation commands to "just work" for all boards, and would 
initially claim that if they don't, it's a bug in the makefiles that 
should be fixed there.

> diff --git a/test/py/conftest.py b/test/py/conftest.py

> +        if device_tree:
> +            o_dt = 'DEVICE_TREE=%s' % device_tree
> +        else:
> +            o_dt = 'all'

You might want to make o_dt be a list that's either empty or contains 
one string. Then ...

>           cmds = (
>               ['make', o_opt, '-s', board_type + '_defconfig'],
> -            ['make', o_opt, '-s', '-j8'],
> +            ['make', o_opt, o_dt, '-s', '-j8'],
>           )

... you can modify that line so that it doesn't add any additional 
options if o_dt is empty, so there's no change to the command-line 
except in the case where a DT is specified, to avoid the potential for 
any change to the existing flow:

             ['make', o_opt, *o_dt, '-s', '-j8'],

or:

             ['make', o_opt, '-s', '-j8'] + o_dt,
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
