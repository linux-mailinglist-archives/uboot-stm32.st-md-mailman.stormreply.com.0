Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 228519A6A41
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2024 15:29:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE2E8C78035;
	Mon, 21 Oct 2024 13:28:59 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48F71C78033
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 13:28:52 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539f2b95775so5229720e87.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 06:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729517331; x=1730122131;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y/gm9qMtxJAEeRM95VewSipPtgwCIhqJg+I80r1GaWo=;
 b=FS8meA5LWCM00n6UIEMMRCy1E1CLUcY5RHRYmRfUWs3tX8oF9Inbsul0jJBN1N/SQu
 pveE/IPYGJwx0Rwy00vS8ycUB3FxdAxax3O4C++xq9mVGZrUxEPoiCoLSNB2/nRf/dgn
 GmXrQZbywpxDRS9KTaO8nQo1/jUNm41D9SyzuvR/Q47UWSTEvVXjs3rfv9VRdruhptCF
 X0ZMuaHSBM+w3UEQ9qZcT+e3Pmu2y+Q4I0YXGgZcDk74Qq7zf3l9GOsPy4YQxYOdWk0F
 9xGHbghEd6QE6GaVWnE9erEcVqI7MV2gQjPFrszB9g2AbGAyxNb55xHAkM0rFvCDXkHE
 CB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729517331; x=1730122131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/gm9qMtxJAEeRM95VewSipPtgwCIhqJg+I80r1GaWo=;
 b=udKv1iUH9bPGNo9rs0SAzCg2cIUOYICTLuNMiSGzbFDqlbkdj8xNgV+X3lxwweQJjD
 MODXmsy2bLMWO/QBcuOgdwBnW3oFEJnfbhHWJ0LJlYXerjDcXlp48ksR2d6Om4PYcBuA
 yD5+zGwdDuxqeyzJSdu33owHTZvbHet7bY+IPJ6tE6wC7eGeGx6BAFZPSeKP7KGM2N5q
 z8gIx4LUCCE29WXrCpgHIayTx0Y3N41ZSNRaItw5WqIH/Bc11+RHRk+dnznxYCn9pyxz
 KjlEJow5XjlLQRvq26awK3Omc/4et56WjgPesYrxMFF5SVhHia1XUyRbe+GKASxO0JNL
 t+lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV3JmoTS/KSEcBUe6ifH7Dnm0r3BpmifvLJE7yq5Ok64/cEfR2jmyOM8ZLE3B+Qv7u2A5BPjwjgNyiig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUJvLhw/nvjyLILrad/UxvNZWQwbSmS2mZeoYXWBbJyCjj4hqh
 JhGGtAKCaSWugTibj+E5EidKEeRcB/92jTuF9VoIbsdLORPw12qTxIU93rsGY3c=
X-Google-Smtp-Source: AGHT+IHC5mjADUYzm1NDoOaEh6pbfhw20oQZVk+/WO3nB3CZ53Hfh7TujxqSpMr8XibEuLCNYG2Uog==
X-Received: by 2002:a05:6512:3989:b0:52c:e10b:cb33 with SMTP id
 2adb3069b0e04-53a154d857fmr8475301e87.50.1729517331332; 
 Mon, 21 Oct 2024 06:28:51 -0700 (PDT)
Received: from ?IPV6:2a02:8109:888d:ff00::2? ([2a02:8109:888d:ff00::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91599362sm203238266b.197.2024.10.21.06.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 06:28:50 -0700 (PDT)
Message-ID: <4b6297f7-4433-46c3-8661-4f68d7320c7f@linaro.org>
Date: Mon, 21 Oct 2024 15:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20241021114247.349863-1-sjg@chromium.org>
 <20241021114247.349863-2-sjg@chromium.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
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
 Raymond Mao <raymond.mao@linaro.org>, Matthias Brugger <mbrugger@suse.com>,
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

Hi Simon,

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

...

> diff --git a/arch/arm/mach-snapdragon/board.c b/arch/arm/mach-snapdragon/board.c
> index 2ab2ceb5138..7a7a36831c3 100644
> --- a/arch/arm/mach-snapdragon/board.c
> +++ b/arch/arm/mach-snapdragon/board.c
> @@ -147,12 +147,11 @@ static void show_psci_version(void)
>    * or for supporting quirky devices where it's easier to leave the downstream DT in place
>    * to improve ABL compatibility. Otherwise, we use the DT provided by ABL.
>    */
> -void *board_fdt_blob_setup(int *err)
> +int board_fdt_blob_setup(void **fdtp)
>   {
>   	struct fdt_header *fdt;
>   	bool internal_valid, external_valid;
>   
> -	*err = 0;
>   	fdt = (struct fdt_header *)get_prev_bl_fdt_addr();
>   	external_valid = fdt && !fdt_check_header(fdt);
>   	internal_valid = !fdt_check_header(gd->fdt_blob);
> @@ -170,7 +169,7 @@ void *board_fdt_blob_setup(int *err)
>   	} else {
>   		debug("Using external FDT\n");
>   		/* So we can use it before returning */
> -		gd->fdt_blob = fdt;
> +		*fdtp = fdt;

I believe this is a breaking change. The qcom_parse_memory() call below 
expects gd->fdt_blob to point to the in-use FDT. This is a bit of a 
hack, but doing memory parsing this early simplifies things for us.

Additionally, this change doesn't make the function return -EEXIST when 
it should.

...

> diff --git a/include/fdtdec.h b/include/fdtdec.h
> index 555c9520379..9e36acc7e9b 100644
> --- a/include/fdtdec.h
> +++ b/include/fdtdec.h
> @@ -1191,11 +1191,13 @@ int fdtdec_resetup(int *rescan);
>    *
>    * The existing devicetree is available at gd->fdt_blob
>    *
> - * @err: 0 on success, -EEXIST if the devicetree is already correct, or other
> + * @fdtp: Existing devicetree blob pointer; update this and return 0 if a

It doesn't looks like this is initialised before calling 
board_fdt_blob_setup()?

Kind regards,
> + * different devicetree should be used
> + * Return: 0 on success, -EEXIST if the devicetree is already correct, 0 to use
> + * *@fdtp as the new devicetree, or other
>    * internal error code if we fail to setup a DTB
> - * @returns new devicetree blob pointer
>    */
> -void *board_fdt_blob_setup(int *err);
> +int board_fdt_blob_setup(void **fdtp);
>   
>   /*
>    * Decode the size of memory
> diff --git a/lib/fdtdec.c b/lib/fdtdec.c
> index 60e28173c03..e876b17f9ad 100644
> --- a/lib/fdtdec.c
> +++ b/lib/fdtdec.c
> @@ -1706,11 +1706,16 @@ int fdtdec_setup(void)
>   
>   	/* Allow the board to override the fdt address. */
>   	if (IS_ENABLED(CONFIG_OF_BOARD)) {
> -		gd->fdt_blob = board_fdt_blob_setup(&ret);
> -		if (!ret)
> +		void *blob;
> +
> +		ret = board_fdt_blob_setup(&blob);
> +		if (ret) {
> +			if (ret != -EEXIST)
> +				return ret;
> +		} else {
>   			gd->fdt_src = FDTSRC_BOARD;
> -		else if (ret != -EEXIST)
> -			return ret;
> +			gd->fdt_blob = blob;
> +		}
>   	}
>   
>   	/* Allow the early environment to override the fdt address */

-- 
// Caleb (they/them)

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
