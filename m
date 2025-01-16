Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6BA13794
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Jan 2025 11:15:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2311FC78F73;
	Thu, 16 Jan 2025 10:15:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80824C78F6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 10:15:47 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso4464495e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 02:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737022547; x=1737627347;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=er8rp9CGjktBCm/y58SqcfOGuzBpC60m/kkY+m+C7e8=;
 b=1TmSJCwFHT9lLN5fEUCX1eHZHZDNllxveg6zUbrzjMSwCPN2q9jONiMrKVZqr/VrIl
 VzhkfvNI1UnZYfqZ2x8F5pKWmhrsw8HIZ+51jrQYnaYSGD4w12BuIiRdunh/mTh8Y7xY
 BWhVqRjf/jHHqAD6WJQ3aBbgf3u2bR+4OSKddLgqzSL+Ii6pUxy5tCe/wv12Pm6l1uDT
 /kQftVSLryG0a6aQqwoo+wrZtrLA9iGGeXLo+9xZX+bqniRk/csj6mHRnTC8CHXQv94W
 Uowvz/KbAPaD/GPxavN7L0xiPBwKWvdBKpVC1PIEcehCeAxuvO9UsFK+6rDDJpReDqyZ
 /Wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737022547; x=1737627347;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=er8rp9CGjktBCm/y58SqcfOGuzBpC60m/kkY+m+C7e8=;
 b=qTTavvA6G4LCCUP7ZkmxCH6djFZxTHbbcPorKDPrE2D0WohI78/XBLaygs0weG9e6+
 ULrKkbBUb3QEmQZ/GZUB9uutsMgR3mC2DOeo4X8GA7HDP9eebx4CRjBHerB4oPONOEws
 SeGuaDQWOaeNq6PpRxVZQRe+I4VTLW6683J2HcSR/QLytoskCW1PJ8a4Vf9vERaI/drr
 C4yB/zhgyA2w2mAqathozq1+WvN6Cfg2AjJvYRec3EDa0iYhmZaW9mPRsmTQIv98hoxv
 go3Zb4Al2KgH/mFi6l531+iW0eyEVRPTXnJ5NqgyiyT0thzV/6Kjw2TgyuaAgIb2yGBQ
 F0Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbxOXTYHKUFG8Wfn9ckWprqFPXGA8JtQP05vtt/OrQX/kdo32RrqSJXOXjxxNEehUMljrSpL3lfc8Qgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9TCIY7UJ/FA543tb1oj3oWtRfptfroZw77dl3L5pCOjaAG0Bf
 W9Wt25MHOowEMd8UPWGT3cqBnAgeXTMJK1FMmgFHiRsiU3GQC8+hLEKIYQifbPY=
X-Gm-Gg: ASbGncsXuxUjq5C/qR+LlwRMmKm+TUVg6DkWWAk5FkT76FcQMs3JgfmvtSf3S6CZhuG
 zkEhJK/+sCvB2fiT0L1VUEcQH+lvvTKMGnGXWumDLYcgemdb61MzS7XSOwoq2ff25+iA0JejLPc
 ZQAhm99vRaU4Q76OXGDomOzFzzGo2Wf2r0q0vW0bH/7O6BcH+eVMbwG5fsoVNS832B2DqH+u6bI
 jvwL7BLHIrOYxdfrSMYe4a44AMlqG5GVbzz6gUtkd2cyFMFlyccWEyGDJ0/NwoCPg==
X-Google-Smtp-Source: AGHT+IGBxsvY2KXA1C77rcCpOr3Sm2NbLbNgg7tMZCybLr+FbNI1hNLQ98qcgq2DDnVGcFy8lcvnIw==
X-Received: by 2002:a05:600c:a014:b0:434:e69c:d338 with SMTP id
 5b1f17b1804b1-437c6b014f7mr50794935e9.5.1737022546935; 
 Thu, 16 Jan 2025 02:15:46 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c7499558sm55137405e9.8.2025.01.16.02.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 02:15:46 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
In-Reply-To: <20250116081738.2511223-9-patrice.chotard@foss.st.com>
References: <20250116081738.2511223-1-patrice.chotard@foss.st.com>
 <20250116081738.2511223-9-patrice.chotard@foss.st.com>
Date: Thu, 16 Jan 2025 11:15:45 +0100
Message-ID: <874j1z83ou.fsf@baylibre.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 8/9] board: stih410-b2260: Remove
 board_usb_init/cleanup()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,

Thank you for the patch.

On jeu., janv. 16, 2025 at 09:17, Patrice Chotard <patrice.chotard@foss.st.com> wrote:

> Since DM_USB_GADGET is enable for this board, board_usb_init()
> and board_usb_cleanup() can be removed.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Yay, glad to see some more board_usb_{init,cleanup}() getting removed!

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>
> (no changes since v1)
>
>  board/st/stih410-b2260/board.c | 29 -----------------------------
>  1 file changed, 29 deletions(-)
>
> diff --git a/board/st/stih410-b2260/board.c b/board/st/stih410-b2260/board.c
> index 3a495eb5089..8ad593cccdd 100644
> --- a/board/st/stih410-b2260/board.c
> +++ b/board/st/stih410-b2260/board.c
> @@ -7,10 +7,6 @@
>  #include <cpu_func.h>
>  #include <init.h>
>  #include <asm/cache.h>
> -#include <asm/global_data.h>
> -#include <linux/usb/otg.h>
> -#include <dwc3-uboot.h>
> -#include <usb.h>
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  
> @@ -42,31 +38,6 @@ int board_init(void)
>  }
>  
>  #ifdef CONFIG_USB_DWC3
> -static struct dwc3_device dwc3_device_data = {
> -	.maximum_speed = USB_SPEED_HIGH,
> -	.dr_mode = USB_DR_MODE_PERIPHERAL,
> -	.index = 0,
> -};
> -
> -int board_usb_init(int index, enum usb_init_type init)
> -{
> -	int node;
> -	const void *blob = gd->fdt_blob;
> -
> -	/* find the snps,dwc3 node */
> -	node = fdt_node_offset_by_compatible(blob, -1, "snps,dwc3");
> -
> -	dwc3_device_data.base = fdtdec_get_addr(blob, node, "reg");
> -
> -	return dwc3_uboot_init(&dwc3_device_data);
> -}
> -
> -int board_usb_cleanup(int index, enum usb_init_type init)
> -{
> -	dwc3_uboot_exit(index);
> -	return 0;
> -}
> -
>  int g_dnl_board_usb_cable_connected(void)
>  {
>  	return 1;
> -- 
> 2.25.1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
