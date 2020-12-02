Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4BB2CC3E2
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 18:32:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAD90C56635;
	Wed,  2 Dec 2020 17:32:03 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEAABC06150
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 17:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1606930304;
 bh=5qZJxvsQmY9ShN+7I7IbE4FGw/nErLgYfTjCii+GhY4=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=CJzfXvBhV+rVtEmYDAhCV/EDJHZC0KwbABr8QcxlCftNTplkmHgd/cAatmd5bBH9n
 5dskjnbVCsLBYR8eoGwX48qfQ+EMdKSFyZGRjA4G+DXOq1LOyyqwZtQh4lvecza+xv
 5REzHsRCx8qJkuGdtIPRGJ16oLjC75y0raArG0+g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([62.143.246.89]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvvT-1kGPIT0YGr-00hJXe; Wed, 02
 Dec 2020 18:31:44 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20201202172110.7809-1-patrice.chotard@foss.st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <d568fed8-9a8f-02d1-c2f3-cc95598c3ac3@gmx.de>
Date: Wed, 2 Dec 2020 18:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201202172110.7809-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:qV5v060PFXpNyEPpMOaHCoXtQUoQtZD0f9ZbnlM+FVlIpvnMLlT
 IJGnct6qwMfLrLHCjmmwQf1Ng7soXlAPANpBlndLNyZkS2Gl/8NFak/dkCZEbyVDMuyw896
 k4FSJCDUj0TTw+4S3stYNpiG1DeEFgxddlir9Xj7eMVcp8YnlHntZcmTC5oWN//Y4pNFurN
 fDKNzup9aMGFJiwP8J0pw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rtuOYLHRRaY=:Mm4QslQGL4N38TcoNttDT7
 RaA1CT1cHuLnu3KbTMacuDA2RUglBh2mmfrwm+Lxvz9WZ8veV9pgUW6kQ77b7DUcV5wP7TJLR
 SMMo0zOTFV7+oyrB/NULTkh5wDfX3RdcaetIK1tnX+X2JQfpkwx4iYWS7ylU2iXdxhRdue913
 ya76HVDsPv9lo/KAoXfNpodSdG5NBdmRKB3GuNYKTXHketql0eFCT034tJ61DveR8znOMCyeJ
 HenqfoOgWfjOif78dT8r9A7CQFB+g9BkDDxCF0i9ATk83WPqJVKqcoKzg0tOQQdJwlwk0IAE5
 dkUAM+hFPJN3g1B0ZeJnHHnluXUCU9gMzchdaY7+zS+nAsKOHw1IpWZSb1vK0eZvUDXWOidc+
 /VJoyR3USq0krOPyn2FuBCxrioXsHUUzZMDUjeoJqbrWOBwX0W+zrt8ozPeHr4SVF+ctxS2pf
 VR/8qcvBRBRaMZf+7PjcgahBWCI6CXeqFgD+Vd2wguWP4dSaVsKk8aJ5DP0mKh5YqEtsamcHb
 +klXw6ZQ5rO46R1QQbtwNBUfLlOsFhn01j37hP4A1HmFFmoGSO7FppXdFImA+TTTf/6gYCS8f
 3OQyRA+Oec1f9Vlz61PM/0ql6sbbEJU3nAsVJ8aVO/IE64htvACt6ID31E4Udysly9XjRJtr6
 qaZ8p+29xDlP7jG79fez2dvgh2n6/nhuz5Nn6rnuR/H9TQCXqoM2wXmldeOQb6tgiRMPbqsy2
 XmdGBWTEzUd6rimgVwQHKHq7p0QH8pKoPiuc1w0Cu9V93K1ivyG+N5VdFqWmOnhur3PftV78M
 pswub6ahioSa+MVpVYETw0SjB7Z7nY36cx5UoqeGLP9WX4nja7v1l6J8e/U4pxPfkhIWdPXVH
 SoulEsmBlsTpVDkUnNNg==
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Amit Singh Tomar <amittomer25@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sean Anderson <seanga2@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Robert Marko <robert.marko@sartura.hr>
Subject: Re: [Uboot-stm32] [PATCH 1/2] MAINTAINERS: Update ARM STI and ARM
 STM STM32MP Arch maintainers emails
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

On 12/2/20 6:21 PM, Patrice Chotard wrote:
> Update Patrick and my email address with the one dedicated to
> upstream activities.

It might make sense to add entries to .mailmap too if you have
contributed to files where you are not the maintainer.

Best regards

Heinrich

>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 874cf2c0e5..ed5d7c3ab6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -385,7 +385,7 @@ F:	drivers/smem/msm_smem.c
>   F:	drivers/usb/host/ehci-msm.c
>
>   ARM STI
> -M:	Patrice Chotard <patrice.chotard@st.com>
> +M:	Patrice Chotard <patrice.chotard@foss.st.com>
>   S:	Maintained
>   T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
>   F:	arch/arm/mach-sti/
> @@ -411,8 +411,8 @@ F:	arch/arm/cpu/arm926ejs/spear/
>   F:	arch/arm/include/asm/arch-spear/
>
>   ARM STM STM32MP
> -M:	Patrick Delaunay <patrick.delaunay@st.com>
> -M:	Patrice Chotard <patrice.chotard@st.com>
> +M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
> +M:	Patrice Chotard <patrice.chotard@foss.st.com>
>   L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
>   T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
>   S:	Maintained
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
