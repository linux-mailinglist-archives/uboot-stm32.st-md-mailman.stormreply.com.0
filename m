Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E72591651DA
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Feb 2020 22:45:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99684C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Feb 2020 21:45:22 +0000 (UTC)
Received: from avon.wwwdotorg.org (avon.wwwdotorg.org [104.237.132.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28C9CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 21:45:21 +0000 (UTC)
Received: from [10.20.204.51] (unknown [216.228.112.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by avon.wwwdotorg.org (Postfix) with ESMTPSA id 35F021C46F1;
 Wed, 19 Feb 2020 14:45:19 -0700 (MST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.1 at avon.wwwdotorg.org
To: Patrick Delaunay <patrick.delaunay@st.com>
References: <20200212184501.5911-1-patrick.delaunay@st.com>
 <20200212184501.5911-7-patrick.delaunay@st.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <2676d34e-0af4-bb5b-dc37-167eba9a9d1b@wwwdotorg.org>
Date: Wed, 19 Feb 2020 14:45:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200212184501.5911-7-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 06/10] test: environment in ext4
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

On 2/12/20 11:44 AM, Patrick Delaunay wrote:
> Add basic test to persistent environment in ext4:
> save and load in host ext4 file 'uboot.env'.
> 
> On first execution a empty EXT4 file system is created in
> persistent data dir: env.ext4.img.

> diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py

> +def mk_env_ext4(state_test_env):
> +    c = state_test_env.u_boot_console
> +
> +    """Create a empty ext4 file system volume.
> +    """
> +    filename = 'env.ext4.img'
> +    persistent = c.config.persistent_data_dir + '/' + filename

The test seems to want to delete this file at the end, and re-create it 
each time. Why store it in the persistent data directory in that case?

> +    if os.path.exists(persistent):
> +        c.log.action('Disk image file ' + persistent + ' already exists')

... and why just delete it and re-create it if a stale copy exists?

> +    else:
> +        try:
> +            check_call('rm -f %s' % persistent, shell=True)

why not:

     check_call('rm -f ' + persistent)

That has simpler string operations, and I don't think any of these 
commands need shell=True, since they don't contain any shell 
metacharacters? Same comment for most of the other commands.

> +def test_env_ext4(state_test_env):

> +    """ env_location: ENVL_EXT4 (2)
> +    """

I think that'd be better as a regular comment:

     # env_location: ENVL_EXT4 (2)

If there's a reason to make it a docstring, lets put the trailing """ on 
the same line since it's a short piece of text.

> +    response = c.run_command('env_loc 2')
> +    assert 'Saving Environment to EXT4' in response
> +
> +    response = c.run_command('env_loc 2')
> +    assert 'Loading Environment from EXT4... OK' in response

Can't both assert invocations run on the same response? Or, does the 
env_loc command do different things based on some other state; that 
would feel pretty nasty.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
