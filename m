Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A63A40F4DB
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Sep 2021 11:35:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE284C597BC;
	Fri, 17 Sep 2021 09:35:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F9CCC5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Sep 2021 14:49:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso7591303wmb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Sep 2021 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r7QFRX8PBAbyeCR6FK19Z+LiM7KadU/IlIr3Chk0uwc=;
 b=iDPrwsCbJq8s70yk8hDTUlKKV8nok+Xou/0v6zbXi8ptcFO6O81mP1urEYQhmzo1eZ
 5Z2j5m3rlVhPYR3Bw96BVARKCJ6OTQQnLkQaxlNZBmjnhVSgOqfMO9S4WxqU1s/bTdDN
 wem/aVV/2RHhHYzqhcCVS/n+wf9PJX2gToSlhMuyt3RPVNP+SXrORd7VXqK/I5mYpHIa
 gMxiszsn2u9jkYI8cGV8exhaHfGNV2I8hHvbnEmhAW1eBuSKZWUhscwjqbCU63QvE3/K
 bYdfVZlHsmYBfte3tbxT9cfqzZ00U0iuuMS1yrdW8edNFYqCmBhRNBJWUto5O9RiW8Sn
 gVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r7QFRX8PBAbyeCR6FK19Z+LiM7KadU/IlIr3Chk0uwc=;
 b=sMQZA0FLnIiALrVVzGGg+7AspVbdysMmtA3ldbrR8rttMYAAsOhBf1Bm30Gun6c4QA
 nUeXI7WsMJRZ/XYRYWORi4mXUPO1Y/kS5etsQMyx4gjrHwb+7kbSnUP8a+3KsnirRJAy
 vtMZ4o3vK2pmdzUPDHWPNw8KKxl4tdMftDKSw/8ONf9QyejonOk/6gEPd4nBoVU5yYxe
 wMQG55mIkSjqRsW7GZVAq1V7k5xV0XnucOc+5dFGBfFvXlw2t5v2TVNZwUUa0WRXQdbj
 7prOgSsC7y5n9Ej0/VKbFwwp5AftOeMCJ1kJfqzE3lBaRXl0DlNXTotGCSBCKyEcSppn
 a+iw==
X-Gm-Message-State: AOAM53019BokHfR1Ew2++vJJ/e8p32Ap8T+jJKz3qInlcaKcvYqPnsBG
 S2iwHnLlERqWqEA7HHJVtK0=
X-Google-Smtp-Source: ABdhPJxPa2Z3r4FIPtuPbd8Rd0KZzTk0aaAubBlAKhQM0fcNGd/7vhnEp2A9V662v1Vk/lN65GkEww==
X-Received: by 2002:a05:600c:4f52:: with SMTP id
 m18mr10164314wmq.34.1631803782643; 
 Thu, 16 Sep 2021 07:49:42 -0700 (PDT)
Received: from thinkpad ([2a0e:b107:ae1:0:3e97:eff:fe61:c680])
 by smtp.gmail.com with ESMTPSA id k1sm3767521wrz.61.2021.09.16.07.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 07:49:42 -0700 (PDT)
Date: Thu, 16 Sep 2021 16:49:37 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <behunmarek@gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210916164937.6b87b1ff@thinkpad>
In-Reply-To: <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
 <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Sep 2021 09:35:11 +0000
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, u-boot@lists.denx.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v3 2/2] mtd: spi: nor: force mtd name to
	"nor%d"
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

On Thu, 16 Sep 2021 16:01:18 +0200
Patrick Delaunay <patrick.delaunay@foss.st.com> wrote:

> Force the mtd name of spi-nor to "nor" + the driver sequence number:
> "nor0", "nor1"... beginning after the existing nor devices.
> 
> This patch is coherent with existing "nand" and "spi-nand"
> mtd device names.
> 
> When CFI MTD NOR device are supported, the spi-nor index is chosen after
> the last CFI device defined by CONFIG_SYS_MAX_FLASH_BANKS.
> 
> When CONFIG_SYS_MAX_FLASH_BANKS_DETECT is activated, this config
> is replaced by to cfi_flash_num_flash_banks in the include file
> mtd/cfi_flash.h.
> 
> This generic name "nor%d" can be use to identify the mtd spi-nor device
> without knowing the real device name or the DT path of the device,
> used with API get_mtd_device_nm() and is used in mtdparts command.
> 
> This patch also avoids issue when the same NOR device is present 2 times,
> for example on STM32MP15F-EV1:

This is an unfortunate hack :( This is another reason why the whole mtd
subsystem should be refactored.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
