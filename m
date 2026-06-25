Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GruTKUYwPWrDyggAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 15:42:30 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 305046C6361
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 15:42:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=chromium.org header.s=google header.b=VjZvvnJu;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=chromium.org (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCF91C424DB;
	Thu, 25 Jun 2026 13:42:29 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AAD9C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 13:42:28 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c07c246ad7bso354464966b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 06:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782394947; cv=none;
 d=google.com; s=arc-20260327;
 b=D3hxVKV/83TkKi+TZWnhBKwcm4p/iwALP32DbctIwv9yFb5uXM2n+LOxA/5ood4mFT
 Fq+RqFKadwemLuyIC+IN9PU+PLVyX01NSU6yM3rQeBlGc+/2hgJ7nHJ+P0q7G5Uw0mjf
 T+oPPEBPrv7IkO86hMj+rzjr9RianUqkkrmWQfaOlQGIDBdWIkToEp525QdeCyfC17b5
 eQjuvhzXvObydd2MOi7pfcpo+HjCBF6ukyoiLTaleCx72wVlh9TFittcLv7wkApxEm3w
 qEMgvs6bJonJKFPQWo95/DsUEnB74KrpLBv9CIFRptm+pwHn0WtLw4B6DfWb438n7qU+
 HRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rmnejHaq4H7frlKucsNaUHk/BfL/bxJ2tYdK3BOiZVM=;
 fh=NkZscRF0em4Um+Wfq7dmqWi6s1EDyTaT49B0Eg2/bk0=;
 b=fjaB0Evvfb+N2La5Wy5Edp4oqi4rAEuafHB+NByDd27fcWfpjP0ogLU1kh4AtT/D0Y
 lfukjqlMPIBpjHlhJ8YpGi4ie62uTDtGA823t+NTbRR5AHvzhDdTQHZWYjC0E77r0/0k
 GukVxI7RtYZXfT1UY9Sh7Hz+eIOFymjJbOJhkD8S1DEIZNMHhO3tt89sCE72RY2HULpO
 1rB0+ikmjv4InP+KhQ/8/GN4QvCljN+nYzJHw2BiHtdopp4mIpQ1NjmseFhfWCXN9zvP
 mUMSHBcCtxMUnoEtAeJZMSiI9WyudehMK/k1g9eCBSC482J53WmBH6G2onXhIlvQtSHn
 mMZQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1782394947; x=1782999747;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rmnejHaq4H7frlKucsNaUHk/BfL/bxJ2tYdK3BOiZVM=;
 b=VjZvvnJuyWu+4yWHN5DFIgQh2TRz2g6QzALLFhwLLTulc28ZnZtVBIuDbTwbVH0g+m
 1JvG+Hv4dNHQVaucA5rFoSFsFrW+dgTqVQmrQd3a/iX2OLBVOZgrjv1Avgop6c00emuc
 VD88nChW1/QYrPYiEQBgfY7iWLmgNIr5YF+sM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782394947; x=1782999747;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rmnejHaq4H7frlKucsNaUHk/BfL/bxJ2tYdK3BOiZVM=;
 b=DzGZ63p3ipSMxc7rmDeZYIYAyGOAyc9D934ViW+3VEz//yppGxyeBoH7CXmmNq/d2z
 AxTkT5X8Me5FQr/mRSxu8FpVniEJC/6hN876T1L8HmMLkOZSRKEZn5MCxPVy//Hx/6wc
 R6JWyKFXs89JhTjfiRMx5qcakYbbAJy1mFtxLZEK5haM45O5O5C/POUJRlDAF6mA5eXm
 zyXVWArNwPAQ4Yg2Tgg7TS7xcapddPOtkyJF+TMBQ6p36K1PWz12PwYwocS+TRjnb9ST
 RwZfrkgFBqTH65xN86GYx417Q3KB4+2731bs3l7FoyKu8rawqwSa5ObiB0PEYkb10pkb
 t5OA==
X-Gm-Message-State: AOJu0YwRIX83qqSteXtHrtDDM30546lYG1ZYmF+hnkExykwlbSyivpkn
 CqTVVPuQcA0Rol0M5dJIxjcVRwZsRxSohW+1dcVp4+dK/QHq/cbX9Ol5gic34GScBftCl909xM/
 80Ca0YA7XiI/zE4XEfzhJe2KJCq38Gflpk3RzRSz2
X-Gm-Gg: AfdE7cmk9Tzr4AMc8cviotuGnTUpwNfpo/HRi7/McjR9yR5wJuZPK5Npa45E6dtbFm9
 vbJGUuJHtKV1AUD8c3qFHpRhMYpw4yol7rCJ2dDQ8Cyx4/UpJfvL+GWJBwC2+S0m4gI/NoQd1NM
 HQR4OLPzDw+0fnycGoAjMo7TdCvTS0jB8t6vHUDfBGITiiTiTUnvE/zKkJoYmCxVFePr4aKlgKV
 zLomGn+dR8twslf8AUkdC4AjXwUr29e6GFfvAarspmS5JaAf2xFDS6+seCr0+I0pr42jVxP651E
 IWLk4w0l
X-Received: by 2002:a17:907:c448:b0:c05:8586:da12 with SMTP id
 a640c23a62f3a-c1206180d8emr187472366b.50.1782394947511; Thu, 25 Jun 2026
 06:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
In-Reply-To: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 25 Jun 2026 14:42:14 +0100
X-Gm-Features: AVVi8Cc_IgNh3b_eiDMxpJcFo7vth8fa7pvz5fTOl3f8Tk5B3-14rn3HRJXkU_w
Message-ID: <CAFLszTiMJDrOhGcJtsr6JKQYu8NZTRWZF+3aQ0yO0CGMVZAfEA@mail.gmail.com>
To: Anshul Dalal <anshuld@ti.com>
Cc: Peng Fan <peng.fan@nxp.com>, Yegor Yefremov <yegorslists@googlemail.com>,
 Tuyen Dang <tuyen.dang.xa@renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, u-boot@lists.denx.de,
 Daniel Palmer <daniel@thingy.jp>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Jimmy Ho <jimmy.ho@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 "Lucien.Jheng" <lucienzx159@gmail.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Peter Korsgaard <peter@korsgaard.com>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Alice Guo <alice.guo@nxp.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 Nick Hu <nick.hu@sifive.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Mateus Lima Alves <mateuslima.ti@gmail.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Beiyan Yun <root@infi.wang>, Jonathan Stroud <jonathan.stroud@amd.com>,
 Justin Swartz <justin.swartz@risingedge.co.za>,
 Bhupesh Sharma <bhupesh.linux@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh <dinesh.maniyam@altera.com>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Neha Malcom Francis <n-francis@ti.com>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Padmarao Begari <padmarao.begari@amd.com>, Alexey Charkov <alchark@gmail.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] treewide: Kconfig: use bool instead of
	tristate
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[chromium.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anshuld@ti.com,m:peng.fan@nxp.com,m:yegorslists@googlemail.com,m:tuyen.dang.xa@renesas.com,m:casey.connolly@linaro.org,m:quentin.schulz@cherry.de,m:shawn.lin@rock-chips.com,m:sebastian.reichel@collabora.com,m:u-boot@lists.denx.de,m:daniel@thingy.jp,m:s-vadapalli@ti.com,m:jimmy.ho@sifive.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lucienzx159@gmail.com,m:marex@denx.de,m:trini@konsulko.com,m:peter@korsgaard.com,m:jerome.forissier@arm.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:alice.guo@nxp.com,m:weijie.gao@mediatek.com,m:lukma@denx.de,m:nick.hu@sifive.com,m:jh80.chung@samsung.com,m:igor.belwon@mentallysanemainliners.org,m:pbrobinson@gmail.com,m:bastien.curutchet@bootlin.com,m:mateuslima.ti@gmail.com,m:jamie.gibbons@microchip.com,m:michael@amarulasolutions.com,m:tien.fong.chee@altera.com,m:kory.maincent@bootlin.com,m:mikhail.kshevetskiy@iopsys.eu,m:root@infi.wang,m:jonathan.stroud@amd.com,m:justin.swartz@risingedge.co.za,m:bhupesh.linux@gmail
 .com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:hs@nabladev.com,m:neil.armstrong@linaro.org,m:ycliang@andestech.com,m:ralph.siemsen@linaro.org,m:n-francis@ti.com,m:angelo@kernel-space.org,m:ilias.apalodimas@linaro.org,m:padmarao.begari@amd.com,m:alchark@gmail.com,m:boon.khai.ng@altera.com,m:patrick.delaunay@foss.st.com,m:yegorslists@gmail.com,m:mateuslimati@gmail.com,m:bhupeshlinux@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[52];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,googlemail.com,renesas.com,linaro.org,cherry.de,rock-chips.com,collabora.com,lists.denx.de,thingy.jp,ti.com,sifive.com,st-md-mailman.stormreply.com,gmail.com,denx.de,konsulko.com,korsgaard.com,arm.com,bootlin.com,gmx.de,mediatek.com,samsung.com,mentallysanemainliners.org,microchip.com,amarulasolutions.com,altera.com,iopsys.eu,infi.wang,amd.com,risingedge.co.za,nabladev.com,andestech.com,kernel-space.org,foss.st.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:from_mime,ti.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 305046C6361

Hi Anshul,

On Thu, 25 Jun 2026 at 04:18, Anshul Dalal <anshuld@ti.com> wrote:
>
> U-Boot does not support modules, so having tristate options is useless.
>
> Therefore this patch does a blind replace of all tristate options to
> bool tree-wide.
>
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
> CI: https://github.com/u-boot/u-boot/pull/998
> ---
>  board/st/common/Kconfig      | 2 +-
>  cmd/Kconfig                  | 4 ++--
>  drivers/cache/Kconfig        | 2 +-
>  drivers/clk/Kconfig          | 2 +-
>  drivers/firmware/Kconfig     | 2 +-
>  drivers/i2c/Kconfig          | 6 +++---
>  drivers/i2c/muxes/Kconfig    | 6 +++---
>  drivers/i3c/Kconfig          | 2 +-
>  drivers/i3c/master/Kconfig   | 2 +-
>  drivers/memory/Kconfig       | 2 +-
>  drivers/misc/Kconfig         | 2 +-
>  drivers/mmc/Kconfig          | 4 ++--
>  drivers/mtd/nand/Kconfig     | 2 +-
>  drivers/net/phy/Kconfig      | 4 ++--
>  drivers/spi/Kconfig          | 2 +-
>  drivers/ufs/Kconfig          | 2 +-
>  drivers/usb/cdns3/Kconfig    | 6 +++---
>  drivers/usb/musb-new/Kconfig | 2 +-
>  drivers/usb/tcpm/Kconfig     | 4 ++--
>  19 files changed, 29 insertions(+), 29 deletions(-)

I don't see this in patchwork but it looks like you sent it correctly.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
