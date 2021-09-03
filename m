Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77B4003A1
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Sep 2021 18:43:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F26BDC57B51;
	Fri,  3 Sep 2021 16:43:09 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F067C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Sep 2021 16:43:07 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so7256781otf.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Sep 2021 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y3hgpIddkl2rf/CToczlUpw8VfoHLJbN4JKqnoHQH3M=;
 b=AOdazHaSD7Wi/CWFrhrvjwXdpp9mxXlMbJeKNByz9WRFV6oXGzVVdOXRlrAXqkOQad
 NlEzmzVajun+HvuLM6nklHKMaT5NWJ5+Wsftz8Ulggm/EscDvjB1wEUxdkKJSYs8sDe0
 RfTC/pqw0q/IwCT+Kf5D4PjilxobWCDLTxJ0/vaCN++VuZ1y2W6Um0KxU3x1Jx93O7OA
 vt50votxBcCJ0AFzOzB7MyhfXXwTzMt6odJmBWfsxAhK6/K4DIgDd3Cb3HDAHunTBCer
 Nt0ZNCTRhOuCzeaI9BFU9F36YyDdVyk7n1JmNaav1fvU4X3uQmhcQC1G5MU7JCIXYwWD
 N3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y3hgpIddkl2rf/CToczlUpw8VfoHLJbN4JKqnoHQH3M=;
 b=uiuiSDwpP0x/WpteHTmpZdNu1bTQJpcbY6H7KZRBzMlkz3FD8ZGr2l+Nluncz0N/t7
 I5IyEvcNJSGNEGiCl2GLuEIUNbrstFLaIA6UbTXKFJVuVFMyL0q5x4VoI46nNoS6o3LG
 IJbfdrDJoqnS5RyV8AFp2tXKOObbxT8mGo1Dr7Ny2SLW35ydnoKAJvg4aFSggvL+Dzjg
 41FtpdveUfdv20bsGZYToYXpB0On+qGxWq8WFE+urtQO8eeE/5qP/hZsd3rQ8sUgg++c
 QzaPFFGWijDYpRun0AoM4r4de37fXVXn6kE+2vl7iCRACof8mN9KcdVFN8weB4TIvLrH
 X1Gw==
X-Gm-Message-State: AOAM532o45DGrHnOTcUtUFBTgV+kknqAdrvYzGAtWHevmsuXhzktfCZ/
 llkYUrBrKbm6AItzPzQYc/hXtdAEb0172Q==
X-Google-Smtp-Source: ABdhPJzVTpV+169JAXV5sVWhUYHIxh0ctR17IAU5VARQTucvGBfqi9KtV4beZqVyCOjLuvnyHU6Jmw==
X-Received: by 2002:a9d:6506:: with SMTP id i6mr3879698otl.207.1630687386213; 
 Fri, 03 Sep 2021 09:43:06 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id b3sm1098775oie.1.2021.09.03.09.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 09:43:05 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <569089c3-8936-2a47-930e-218805064413@gmail.com>
Date: Fri, 3 Sep 2021 11:43:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
Content-Language: en-US
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@FreeBSD.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 Samuel Holland <samuel@sholland.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>, etienne.carriere@linaro.org,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Simon Glass <sjg@chromium.org>, Tero Kristo <t-kristo@ti.com>,
 Michael Walle <michael@walle.cc>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lib: optee: remove the duplicate
	CONFIG_OPTEE
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

Hi Patrick

On 9/2/21 4:56 AM, Patrick Delaunay wrote:
> The configuration CONFIG_OPTEE is defined 2 times:
> 1- in lib/optee/Kconfig for support of OPTEE images loaded by bootm command
> 2- in drivers/tee/optee/Kconfig for support of OP-TEE driver.
> 
> It is abnormal to have the same CONFIG define for 2 purpose;
> and it is difficult to managed correctly their dependencies.
> 
> Moreover CONFIG_SPL_OPTEE is defined in common/spl/Kconfig
> to manage OPTEE image load in SPL.
> 
> This definition causes an issue with the macro CONFIG_IS_ENABLED(OPTEE)
> to test the availability of the OP-TEE driver.
> 
> This patch cleans the configuration dependency with:
> - CONFIG_OPTEE_IMAGE (renamed) => support of OP-TEE image in U-Boot
> - CONFIG_SPL_OPTEE_IMAGE (renamed) => support of OP-TEE image in SPL
> - CONFIG_OPTEE (same) => support of OP-TEE driver in U-Boot
> - CONFIG_OPTEE_LIB (new) => support of OP-TEE library
> 
> After this patch, the macro have the correct behavior:
> - CONFIG_IS_ENABLED(OPTEE_IMAGE) => Load of OP-TEE image is supported
> - CONFIG_IS_ENABLED(OPTEE) => OP-TEE driver is supported

It seems a little odd to have both OPTEE_LIB and OPTEE_IMAGE, since they 
are both used together to support booting with OP-TEE. What also seems 
odd is that "OP-TEE driver in U-Boot" does not depend on "OP-TEE library".

Introducing OPTEE_LIB then, makes sense to me, provided that OPTEE 
depends on OPTEE_LIB, but I'm not sure about OPTEE_IMAGE.

> diff --git a/lib/optee/optee.c b/lib/optee/optee.c
> index 672690dc53..5676785cb5 100644
> --- a/lib/optee/optee.c
> +++ b/lib/optee/optee.c
> @@ -20,6 +20,7 @@
>   	"\n\theader lo=0x%08x hi=0x%08x size=0x%08lx arch=0x%08x" \
>   	"\n\tuimage params 0x%08lx-0x%08lx\n"
>   
> +#if defined(CONFIG_OPTEE_IMAGE)
>   int optee_verify_image(struct optee_header *hdr, unsigned long tzdram_start,
>   		       unsigned long tzdram_len, unsigned long image_len)
>   {
> @@ -70,6 +71,7 @@ error:
>   
>   	return ret;
>   }
> +#endif

One the idea of having CONFIGs is to include/exclude code via 
obj-$(CONFIG_FOO)+=code.c. This prevents the proliferation of #ifdefs. 
It's fairly counterintuitive to have a CONFIG_OPTEE_IMAGE in a file 
controlled by CONFIG_OPTEE_LIB.

Going to optee_verify_image() itself. It essentially checks against 
OPTEE_TZDRAM_(BASE/SIZE). But those are a derived from devicetree, not 
Kconfig. So it seems the motivation behing optee_verify_bootm_image() is 
flawed. Also the error message is not very helpful.

In fact, the SPL boot path for OP-TEE doesn't use this function. That's 
intentional.

Here's what I suggest:
   - Remove OPTEE_TZDRAM_BASE and _SIZE
   - Remove optee_verify_bootm_image()
   - No need for CONFIG_OPTEE_IMAGE


Alex
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
