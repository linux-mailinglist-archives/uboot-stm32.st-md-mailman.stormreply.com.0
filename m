Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA19C3CA6
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Nov 2024 12:06:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A439C78F60;
	Mon, 11 Nov 2024 11:06:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53F2DC7803D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 11:06:28 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4314b316495so35409725e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 03:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1731323188; x=1731927988;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Hbr4Yo1YiYF2czCSP3VcaxZd4w8wdZAusyqBBQNYlw8=;
 b=XvHRph2Nwq3sAtg+4nfChJ8rJtQnRCW3wA47UaXjraef6uBxErsk1Ww1i6dx5iK2l6
 q+g1USgwKpTpmlCjwrB8iSb7mL8BB95XfEFdcLaOfVQq7AfMBggLkohy/j8Qa3LiDvMi
 qVMaz6KdMwFe77ptgydQlkkYlqSu0DIj3naMCLs6CJvGVcqBfrxRM1nooqCFx/Vh1FU7
 ruIyf3ZvbyYZlJqdOCw0Iq8KhI/4R+X5HdGf9Ua7xWiRGqh4VXIeQpXastFSu8vpNJmm
 trAw+G4fSrLaFVlTfLRkNZWJTiwvwrRksmMUFC40b0SoQL1JDOQLxKc2CsrCXTYa4zNV
 z/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731323188; x=1731927988;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hbr4Yo1YiYF2czCSP3VcaxZd4w8wdZAusyqBBQNYlw8=;
 b=MznlrjUQQdgj2Z9eWiQO3/Gc9rpiFMeJ+LQyzsv+LmGUf/G0riwu2pNoPGxIJhTWC0
 m8UAFuu+vQkb5aO7WbVZ/5nj4ZW/FkSF9RC03+ESegiZqOa8PyQrksJXwiHmEHBapaOd
 DByZQ0TKtIjVy5ZNCaEhznoncvXF6La8Jj/oC6KwZyepx5aXXmzKB8MR2gIIk7Ktt6aZ
 sh6Q9D1Hbq7PzMK3VVSoyCBRjaMhwBtMqLkhmB9UD/hTBZeirBnepK/A0DCDgF1Psteh
 APQfoKjDFGqbiqM6w/5VtKrr1mByy5QIvxBchxDc07zuYy5GBoULC4EDs9pYqvpQkjBf
 DVSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTUFqMYd4ZRWSOSp6VZffmNmJ9116lbPiCBFSbLSmdayBnhKwIC7Y/TBGD1kRr9lpNsKcRPq+5kMJO2g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yws57DDIEs09bV9z0Mto/nzG/pO7xfJ9ZKYhreXFZ1Sk5JH5dF4
 a97X1vhy1GK7ElKpdFRp9ocN7c8ES5LcxYd8FG4o413fiyuQt7EYpnxr0OGJN+s=
X-Google-Smtp-Source: AGHT+IED99HJPoLQe1TktM1d022Qlq4Xp7+t7O1ob5453M2rW3kSyNpC+SCbkDw8ZRztaXK657TB7w==
X-Received: by 2002:a05:600c:4ec7:b0:431:5f9e:3f76 with SMTP id
 5b1f17b1804b1-432b750967dmr98746005e9.16.1731323187671; 
 Mon, 11 Nov 2024 03:06:27 -0800 (PST)
Received: from [192.168.2.177] ([207.188.162.240])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97ce1bsm12554436f8f.36.2024.11.11.03.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 03:06:27 -0800 (PST)
Message-ID: <b3f491c7-2d95-4f61-af12-88645ed86d59@suse.com>
Date: Mon, 11 Nov 2024 12:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20241102174944.412088-1-sjg@chromium.org>
 <20241102174944.412088-2-sjg@chromium.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20241102174944.412088-2-sjg@chromium.org>
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
 Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] fdt: Swap the signature for
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



On 02/11/2024 18:49, Simon Glass wrote:
> This returns a devicetree and updates a parameter with an error code.
> Swap it, since this fits better with the way U-Boot normally works. It
> also (more easily) allows leaving the existing pointer unchanged.
> 
> No yaks were harmed in this change, but there is a very small code-size
> reduction.
> 
> For sifive, the OF_BOARD option must be set for the function to be
> called, so there is no point in checking it again. Also OF_SEPARATE is
> defined always.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Set up the existing FDT in case the board wants to check it
> - Update snapdragon to return -EEXIST
> - Set the existing FDT before calling board_fd_blob_setup()
> - Update sandbox to return -EEXIST if an fdt comes from a bloblist
> - Update do_go_uboot() to set the existing FDT
> - Drop unnecessary setting of FDT in vexpress64
> - Tidy up redundant RISC-V code
> 
>   arch/arm/mach-apple/board.c                   |  7 ++--
>   arch/arm/mach-snapdragon/board.c              |  9 ++---
>   arch/arm/mach-stm32mp/boot_params.c           | 19 ++++++-----
>   arch/sandbox/cpu/cpu.c                        | 34 +++++++++----------
>   board/Marvell/octeontx/board-fdt.c            | 12 +++----
>   board/Marvell/octeontx2/board-fdt.c           | 12 +++----
>   board/Marvell/octeontx2/board.c               |  3 +-
>   board/andestech/ae350/ae350.c                 | 23 +++++++------
>   board/armltd/vexpress64/vexpress64.c          | 33 ++++++++----------
>   board/broadcom/bcmstb/bcmstb.c                |  7 ++--
>   board/emulation/qemu-arm/qemu-arm.c           |  7 ++--
>   board/emulation/qemu-ppce500/qemu-ppce500.c   | 12 +++----
>   board/emulation/qemu-riscv/qemu-riscv.c       |  7 ++--
>   board/highbank/highbank.c                     |  7 ++--
>   board/raspberrypi/rpi/rpi.c                   | 13 ++++---
>   board/sifive/unleashed/unleashed.c            | 12 +++----
>   board/sifive/unmatched/unmatched.c            | 11 +++---
>   .../visionfive2/starfive_visionfive2.c        | 11 +++---
>   board/xen/xenguest_arm64/xenguest_arm64.c     | 14 ++++----
>   board/xilinx/common/board.c                   | 26 ++++++++------
>   include/fdtdec.h                              |  9 ++---
>   lib/fdtdec.c                                  | 14 +++++---
>   22 files changed, 152 insertions(+), 150 deletions(-)
> 
[...]
> diff --git a/board/raspberrypi/rpi/rpi.c b/board/raspberrypi/rpi/rpi.c
> index 9122f33d88d..c46fe4b2350 100644
> --- a/board/raspberrypi/rpi/rpi.c
> +++ b/board/raspberrypi/rpi/rpi.c
> @@ -508,15 +508,14 @@ int board_init(void)
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

For Raspberry Pi:

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
