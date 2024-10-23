Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F99AC759
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2024 12:06:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8BE5C71287;
	Wed, 23 Oct 2024 10:06:34 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B26AC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 10:06:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so57602445e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 03:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1729677987; x=1730282787;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dcRveJNFsQn1aQvKgBEPKpS/FWUNciOGJYLEcbJjjD0=;
 b=UfyK/uaGsNjEOu4QdPOk/Rrb4gLI76iz3lXVAl6zSL4epLn3HCDTg77DbKOn2ba1IL
 0yxtZsutarr498jzcbRNFFYTz8iWZXZrFVlu/f7dRYH+Xql+/ATsk/j4GIlSkiBxKA+t
 QccqHN70/qjxn0hDgPhFgpeNaK26ldHD8/x40sD2su3DNIwqgDSpircAQXTT1XBV4KUy
 8ctWTRLq88dfe6VwG4/FV3S/JWyD4AAumF7VhVrNjtPIP9HhaXzTyn9uxND2NYf3iShj
 mOuAkD4noHPIOqlGSm5Ld+2IDLpIxM/jeObsYTyzxuzIRZ/yrIADcOL2tRcbJNV1UJDm
 VcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729677987; x=1730282787;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcRveJNFsQn1aQvKgBEPKpS/FWUNciOGJYLEcbJjjD0=;
 b=ecCPsSoh5/A2tNTZucl5vOYwnHQ998+h+QW9FRoTg6+N1zAm99NhE7kpdCo8oH21hR
 fEFs01H8FPKu5RsI1p1aTSbUMSiMvk3MWYJ7xaAD4KxWIrJy9QEzft+zJRgpmkpy2L8u
 HgNtVo+zLt5Q/DnqRKlu6MTYmk0AKz1xfwWiG/r3e81B04u3a0u8X4/x2d4IyDWABOcw
 iebNCp4EufjaVpZoMe6UXawfcc2IX/jUNLbOhyYcuu8yHFw92RXWjCRQ3uAperqX/Fg4
 EAnQjhV8OV0Xq/JdjKa18+CsBwoC5+G30+wIPMrjMCctvi/Oj2IopJFZ8WFaWrMG5RwH
 sh0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmg/Vfqq+zyMCq8VFCvPFjXNAMvdyOm9hciQ0RBZhtF7EBtb2J9uQViWavZf7bMkH/oEp1UvevPVArZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxPBbusks5iFrRbGuOBEiNe6SrcH7H5NOqhqNY2O2RBeEFZQe5q
 9KBVvNNFKZvIY57lE4O9B1T+ZlH4WvLepCl7AD4UlU4pwpyz8nix7OMp1Ltphd0=
X-Google-Smtp-Source: AGHT+IHrDG1Npg7b8vNRGTPu52caFQqLRdbKx2N5Zs1/vV6OG/ogfcRkmzo+yOdhRB2OQ03Jl9N/Gw==
X-Received: by 2002:a05:600c:3b1b:b0:431:594b:8e2b with SMTP id
 5b1f17b1804b1-4318413ee73mr18872585e9.12.1729677987224; 
 Wed, 23 Oct 2024 03:06:27 -0700 (PDT)
Received: from [192.168.0.31] (80.224.71.185.static.user.ono.com.
 [80.224.71.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43186bfb0f2sm11779445e9.22.2024.10.23.03.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 03:06:26 -0700 (PDT)
Message-ID: <2fbf3b65-9131-418d-b0f8-db75586f9101@suse.com>
Date: Wed, 23 Oct 2024 12:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20241021114247.349863-1-sjg@chromium.org>
 <20241021114247.349863-2-sjg@chromium.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20241021114247.349863-2-sjg@chromium.org>
Cc: David Feng <fenghua@phytium.com.cn>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Rick Chen <rick@andestech.com>,
 H Bell <dmoo_dv@protonmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Peng Fan <peng.fan@nxp.com>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Janne Grunau <j@jannau.net>, Marek Vasut <marex@denx.de>,
 Randolph <randolph@andestech.com>, Mark Kettenis <kettenis@openbsd.org>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Anup Patel <anup@brainfault.org>, E Shattow <lucent@gmail.com>,
 Jerry Van Baren <vanbaren@cideas.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Andre Przywara <andre.przywara@arm.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Day <me@samcday.com>,
 William Zhang <william.zhang@broadcom.com>, Sumit Garg <sumit.garg@linaro.org>,
 Francois Berder <fberder@outlook.fr>, Tim Harvey <tharvey@gateworks.com>,
 u-boot-qcom@groups.io, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Green Wan <green.wan@sifive.com>, Minda Chen <minda.chen@starfivetech.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Atish Patra <atishp@atishpatra.org>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Michal Simek <michal.simek@amd.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Eric Curtin <ecurtin@redhat.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Bin Meng <bmeng.cn@gmail.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] fdt: Swap the signature for
	board_fdt_blob_setup()
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



On 21/10/2024 13:42, Simon Glass wrote:
> This returns a devicetree and updates a parameter with an error code.
> Swap it, since this fits better with the way U-Boot normally works. It
> also (more easily) allows leaving the existing pointer unchanged.
> 
> No yaks were harmed in this change, but there is a very small code-size
> reduction.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>   arch/arm/mach-apple/board.c                   |  7 ++--
>   arch/arm/mach-snapdragon/board.c              |  7 ++--
>   arch/arm/mach-stm32mp/boot_params.c           | 19 ++++++-----
>   arch/sandbox/cpu/cpu.c                        | 34 ++++++++-----------
>   board/Marvell/octeontx/board-fdt.c            | 12 +++----
>   board/Marvell/octeontx2/board-fdt.c           | 12 +++----
>   board/Marvell/octeontx2/board.c               |  2 +-
>   board/andestech/ae350/ae350.c                 | 23 +++++++------
>   board/armltd/vexpress64/vexpress64.c          | 31 ++++++++---------
>   board/broadcom/bcmstb/bcmstb.c                |  7 ++--
>   board/emulation/qemu-arm/qemu-arm.c           |  7 ++--
>   board/emulation/qemu-ppce500/qemu-ppce500.c   | 12 +++----
>   board/emulation/qemu-riscv/qemu-riscv.c       |  7 ++--
>   board/highbank/highbank.c                     |  7 ++--
>   board/raspberrypi/rpi/rpi.c                   | 13 ++++---
>   board/sifive/unleashed/unleashed.c            |  9 ++---
>   board/sifive/unmatched/unmatched.c            |  9 ++---
>   .../visionfive2/starfive_visionfive2.c        |  9 ++---
>   board/xen/xenguest_arm64/xenguest_arm64.c     | 14 ++++----
>   board/xilinx/common/board.c                   | 26 ++++++++------
>   include/fdtdec.h                              |  8 +++--
>   lib/fdtdec.c                                  | 13 ++++---
>   22 files changed, 146 insertions(+), 142 deletions(-)
> 

[...]

> diff --git a/board/raspberrypi/rpi/rpi.c b/board/raspberrypi/rpi/rpi.c
> index ab5ea85cf9f..5ce6bee7316 100644
> --- a/board/raspberrypi/rpi/rpi.c
> +++ b/board/raspberrypi/rpi/rpi.c
> @@ -503,15 +503,14 @@ int board_init(void)
>   /*
>    * If the firmware passed a device tree use it for U-Boot.
>    */
> -void *board_fdt_blob_setup(int *err)
> +int board_fdt_blob_setup(void **fdtp)
>   {
> -	*err = 0;
> -	if (fdt_magic(fw_dtb_pointer) != FDT_MAGIC) {
> -		*err = -ENXIO;
> -		return NULL;
> -	}
> +	if (fdt_magic(fw_dtb_pointer) != FDT_MAGIC)
> +		return -ENXIO;
>   
> -	return (void *)fw_dtb_pointer;
> +	*fdtp = (void *)fw_dtb_pointer;
> +
> +	return 0;
>   }
>   
>   int copy_property(void *dst, void *src, char *path, char *property)

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
