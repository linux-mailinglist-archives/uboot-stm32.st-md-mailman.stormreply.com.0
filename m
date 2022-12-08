Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BAF6470C9
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Dec 2022 14:29:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 168C7C6411C;
	Thu,  8 Dec 2022 13:29:56 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9FA5C63327
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 13:29:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 328AB847ED;
 Thu,  8 Dec 2022 14:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670506194;
 bh=oUDTHyO6+fQhhNeJary6UUPZnHiW0QMYYIi2xUGFFcE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dahdCHSGc3KUuF9Zo3wRdXjkDOgCGTGcpGcqcrzm2RCrOJ7GnW+IWIcK+kqsjwj/S
 HW6GUQZ6uNWvTLOuFLMLHQgE+XxlFhj+5LKr3vnR1bFbjh0hMJoYEGS3cf06qGHob9
 0z3E3cAyq0CNar49ca10nZ4zCXKSLCv6B77DH8/IsTFLkLFY2r046NBFJc3yCl32p9
 sdE6L5TSqMKmi8b6c6RZeZPREaRer3RKZL+x3m+RtlIkFPexHSoT9eUWRJt7v+Yr3f
 DT8nAnKiMvOOpGFg77gqc/hHgVWgfwTkgJaJwOkhUc3BwueV816IO+XmzXdI8kojGR
 2VyXTDidwxk+w==
Message-ID: <a50b41c6-b6e9-4a9d-9995-d7e3baf412ce@denx.de>
Date: Thu, 8 Dec 2022 14:27:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221130114146.1.I1944fc560e894329a83e9cf8f50cab3610f4f334@changeid>
 <0a41cbe2-8f9f-4ba9-5ffc-e1047d0e37c8@denx.de>
 <6c8b6387-17bf-a4d1-8c75-d9cfdf512351@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6c8b6387-17bf-a4d1-8c75-d9cfdf512351@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dfu: Make DFU virtual backend SPL friendly
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

On 12/8/22 09:19, Patrice CHOTARD wrote:
> Hi Marek

Hello Patrice,

> I am preparing a STM32 pull request which includes this series
> 
> https://patchwork.ozlabs.org/project/uboot/patch/20221206023515.113556-1-marex@denx.de/
> 
> We got a DFU compilation issue with this series :
> 
>         arm:  +   stm32mp15_dhcom_basic
> +/usr/lib/python3/dist-packages/setuptools/dist.py:473: UserWarning: Normalizing '2023.01' to '2023.1'
> +  warnings.warn(
> +arm-linux-gnueabi-ld.bfd: drivers/dfu/dfu.o: in function `dfu_fill_entity':
> +drivers/dfu/dfu.c:548: undefined reference to `dfu_fill_entity_virt'
> +make[2]: *** [scripts/Makefile.spl:527: spl/u-boot-spl] Error 1
> +make[1]: *** [Makefile:2071: spl/u-boot-spl] Error 2
> +make: *** [Makefile:177: sub-make] Error 2
>         arm:  +   stm32mp15_dhcor_basic
> +/usr/lib/python3/dist-packages/setuptools/dist.py:473: UserWarning: Normalizing '2023.01' to '2023.1'
> +  warnings.warn(
> +arm-linux-gnueabi-ld.bfd: drivers/dfu/dfu.o: in function `dfu_fill_entity':
> +drivers/dfu/dfu.c:548: undefined reference to `dfu_fill_entity_virt'
> +make[2]: *** [scripts/Makefile.spl:527: spl/u-boot-spl] Error 1
> +make[1]: *** [Makefile:2071: spl/u-boot-spl] Error 2
> +make: *** [Makefile:177: sub-make] Error 2
> 
> 
> The correct fix is this patch below which is currently in your usb/master branch.
> I propose to take this patch in my pull request (available today or tomorrow) to make GitLab Ci tests happy.
> 
> Are you OK ?

I still have one more patch to pick/review and then I'll send USB MR.
I can ask Tom to pick it before the STM MR at which point it should all 
be fine ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
