Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NsBiBFvGRmpNdQsAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 02 Jul 2026 22:13:15 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D706FCB01
	for <lists+uboot-stm32@lfdr.de>; Thu, 02 Jul 2026 22:13:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=chromium.org header.s=google header.b=L9hUBP7+;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=chromium.org (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF8C5C7BF8B;
	Thu,  2 Jul 2026 20:05:17 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDFF6C6C858
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 20:05:16 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-698aa7ba320so2044717a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 13:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783022716; cv=none;
 d=google.com; s=arc-20260327;
 b=TLtppU3y1TuuDQojVVcrXlcp9yKSHOflhmy53PcnGrwaADzpFj8yex5DeYbimGT1lC
 uLnqaTw/d+Esh7ZGWvkblwSbCH6LznmpBhMHsRVV1b8AaHumN35KsStMhAnn4SuRhGPg
 trpuvGD/7+OGlWn/0cEdwFrwU3NnXc4itBE3Fy7uQFddLEV3to7bNUIhbJLiCFYjgfe7
 2nXFUXz5JdCiqto7paDNKtb4fN2OUujdSoY1hco/CgJS38n2nvvgeZ4d2C7/J0wbujKd
 0j7duoJd8imGekgZrct9G/Oow6d2v7uApqV1ZoMjGTwTt+3FJ+JWI576jDyR5VKXZIB6
 n/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2/xlT/HWRGck7i4dM3lIph/3hLkivxqF5uWoErRMoOs=;
 fh=NkZscRF0em4Um+Wfq7dmqWi6s1EDyTaT49B0Eg2/bk0=;
 b=pIOanMfqBL2fkHtUGKClGpgaDVh+QM7AETL4mdfknLyntpH0uSxXsYkgBZgUH6or0D
 p+w2g50hNi+jVX13Ip5PNEAKy4z0LsoRM9Uq823shsNUJAttxmD3OaKLIqpDF3n+Ecpa
 AyOwlmDqdPadFecc6dZgTkrh5pou5RSdRpS+A5J6IAWkIadsyzzVk4m0CrpBmpjuJh3/
 NGYiJoIw6Hj/qHCu/upbxvwYimlixoQ+JZ8ty2r0g7sWLrKRW9EssuHjW6EHceqQdC84
 t/dcRMbrcWn1m+rGhrVKBsaCGgM/GMTRXxweaJ5IEfjroAdot1XgLysTz0Q82g64Nxph
 MKrQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1783022716; x=1783627516;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2/xlT/HWRGck7i4dM3lIph/3hLkivxqF5uWoErRMoOs=;
 b=L9hUBP7+F6db20VRCdYsIKjc07tSNoRgE84mg5BdxsHB/0JmpZC0nowjKsYyHhb77Z
 mrEQLfYW+LOZ7NVP5gLqOSXmS2tJG9veoWrixx8igemI3kAfF9sDKImidQL0QSt9xf4W
 tbM5ALe3aiAVE2J2XIji4Mo8xgKclBwvbGYbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783022716; x=1783627516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/xlT/HWRGck7i4dM3lIph/3hLkivxqF5uWoErRMoOs=;
 b=c8KD+i9X1XmAObn63RDb+vy8W48b4pepbQCnoT1lipiaHY2d2W33SygS8L4t47yyg4
 85l1/7J5EKyriUOXUcbb6nDpjTcKyxVI8oBx2BMBqDvHimGyK3PO71FnZJZt+XOx9XcQ
 HOkn7I+AB2TAI8cBzBJi7xfWWn60f6MN2MbTl9v//uoD/iNQ0La4Xv3b5oS7Ydlc54Pz
 PGqV1/9bylO/HCyFFS2rDvh+IgaWdG1n10bZoDNez1foWyuapwIl2aA61SxPXyV6XZUY
 PiwoFNoMPsaI1CWPo2q65MWjjlWKyCR2L8gqwvejaaamzs9Hzz3OhjzCu1pMRFTrGOSi
 a4ww==
X-Gm-Message-State: AOJu0Yytsb2VFcqq6PVQicpLU9VLV90PgF0e7YsbN9IVVbkOHFbssJJ2
 a72rBv7FYhDRDjlJTPhjbgevkq0X7wlIJnxwz8qq4bq4bimdNSDZJjoTKdOXnTeijzG38awkiwA
 jyg88txrYie0qyEuJi+TZhcsktfDqEoGMUTxlVeUa
X-Gm-Gg: AfdE7cn5SfW0F/3rt0oao35kyTuYbUtkCk9ApgR82XA+wYznI2ppyDr6JrS/prd+z98
 cnj7+J4EZRNT39ygrwgnlPoiezkvsdOlP664s1gVCXZ8QLj0M/k7B+d1evA10y9ZYsBIigNP2Lk
 8DU4eLrgc9uml7KLW3qdgk4chrBGfcJv6LHY6r3QGCsf/u7KWoYCfvFEzbn/RUG0GJpCJibarWt
 6qKBVEXhbQECWIJ8YYhRGnOQ13NfnnNfuUVS6J9Se0dPqJ5E0WGgODv7L4G8zSYeByfByCD+cwv
 152fBOk9
X-Received: by 2002:a05:6402:344f:b0:698:8857:9ff0 with SMTP id
 4fb4d7f45d1cf-698c10c4e63mr412843a12.16.1783022716358; Thu, 02 Jul 2026
 13:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
 <CAFLszTiMJDrOhGcJtsr6JKQYu8NZTRWZF+3aQ0yO0CGMVZAfEA@mail.gmail.com>
 <DJL8ONJL18S7.3MUBPJW6U56QR@ti.com>
In-Reply-To: <DJL8ONJL18S7.3MUBPJW6U56QR@ti.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 2 Jul 2026 21:05:03 +0100
X-Gm-Features: AVVi8CfkMRgZnSqeq9nWY4cdR0US8FBTKTUat9J68k-chJ1uxJAxLJr1VQAg4Z0
Message-ID: <CAFLszTj+od=JXpDvzoyTCYKLP5PE429THu2Wj_A4Xvm4LD8FEg@mail.gmail.com>
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
	GREYLIST(0.00)[pass,body];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,ozlabs.org:url,ti.com:email,chromium.org:from_mime,mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76D706FCB01

On Mon, 29 Jun 2026 at 05:14, Anshul Dalal <anshuld@ti.com> wrote:
>
> On Thu Jun 25, 2026 at 7:12 PM IST, Simon Glass wrote:
> > Hi Anshul,
> >
> > On Thu, 25 Jun 2026 at 04:18, Anshul Dalal <anshuld@ti.com> wrote:
> >>
> >> U-Boot does not support modules, so having tristate options is useless.
> >>
> >> Therefore this patch does a blind replace of all tristate options to
> >> bool tree-wide.
> >>
> >> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> >> ---
> >> CI: https://github.com/u-boot/u-boot/pull/998
> >> ---
> >>  board/st/common/Kconfig      | 2 +-
> >>  cmd/Kconfig                  | 4 ++--
> >>  drivers/cache/Kconfig        | 2 +-
> >>  drivers/clk/Kconfig          | 2 +-
> >>  drivers/firmware/Kconfig     | 2 +-
> >>  drivers/i2c/Kconfig          | 6 +++---
> >>  drivers/i2c/muxes/Kconfig    | 6 +++---
> >>  drivers/i3c/Kconfig          | 2 +-
> >>  drivers/i3c/master/Kconfig   | 2 +-
> >>  drivers/memory/Kconfig       | 2 +-
> >>  drivers/misc/Kconfig         | 2 +-
> >>  drivers/mmc/Kconfig          | 4 ++--
> >>  drivers/mtd/nand/Kconfig     | 2 +-
> >>  drivers/net/phy/Kconfig      | 4 ++--
> >>  drivers/spi/Kconfig          | 2 +-
> >>  drivers/ufs/Kconfig          | 2 +-
> >>  drivers/usb/cdns3/Kconfig    | 6 +++---
> >>  drivers/usb/musb-new/Kconfig | 2 +-
> >>  drivers/usb/tcpm/Kconfig     | 4 ++--
> >>  19 files changed, 29 insertions(+), 29 deletions(-)
> >
> > I don't see this in patchwork but it looks like you sent it correctly.
>
> I seems to be up now:
> https://patchwork.ozlabs.org/project/uboot/patch/20260625-tristate_fix-v1-1-95e16153d752@ti.com/

Thanks, found it.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
