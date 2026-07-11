Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id snRvIpOLUWr3FwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sat, 11 Jul 2026 02:17:23 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1684C73FD05
	for <lists+uboot-stm32@lfdr.de>; Sat, 11 Jul 2026 02:17:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=konsulko.com header.s=google header.b=gGpx7eiE;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=konsulko.com (policy=none);
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2D9CC8F273;
	Sat, 11 Jul 2026 00:17:22 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E188C7A837
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jul 2026 00:17:21 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-6a37b2643e2so886422eaf.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 17:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1783729040; x=1784333840;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:mime-version:date:message-id
 :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YbWZ7HwoLgjxsiWWPZQJEsYuNxWCaNpuIjBuIajUoLY=;
 b=gGpx7eiEYR7qxga+H7h51CyFhrb9xBIBfbZxtm2U60DQKTRqyJrgpkoHK/6jcBKJte
 nsK+nN6YtdonofS5xWqdCVY9tiYs4Pq8W3Uv2JZ0hvpX5xO81aub+wspr0XVfYCV/8GI
 HZLluMS82dgFgsr5a4Nx26WeldOiOT98TQ7fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783729040; x=1784333840;
 h=content-transfer-encoding:content-type:mime-version:date:message-id
 :subject:references:in-reply-to:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YbWZ7HwoLgjxsiWWPZQJEsYuNxWCaNpuIjBuIajUoLY=;
 b=LDm7YV6d+a0ua/Zj4FiqzC7hR/G9r6sooR/rP3xjhHZ9NuH7xVlxc+iwOIWe5DLdTW
 7pnhdk43VEh/ttiRo8EYJXRFsxZMguwuHAXwwV0vScHeROquM0rOMaIO32uPT4PmVlZ3
 eaYFmZGx/zPdqx9pQ8k1Mqy9pcXWQa2nsH3sSycpSbvt1SHESfWHC+a2fwwRCw9pRLjc
 hpMCp7dYLbV4dVN6+kfsRcogAFh+FN/VUrw9WNmexM0xvdODPGWkzTkReBiUFfgCmg9p
 6barAtCg5IxmvAHlbW80K+W/d7JRbz1oFkkToB3S1ZfkJhF7OVVP4PJ3aN3vNZtkvu2H
 dEyA==
X-Gm-Message-State: AOJu0YzUvnkDVcjwX0LoW0VbRkY7DGBhgxnnLjm2m8f2hn6VxSxjR63o
 RNRjvo/ZwM1yBkNLjt6qy0jpunclLpm+vnoGCFTvNAMTPSEGLjtzmG1hyx+m2rk2GnY=
X-Gm-Gg: AfdE7cmGGjopOHCDlOXeLwc3pmogQsBMwqXFlBAnJESRHEbZ3INflWGoX6dDgbgdqo9
 qC7fC2U9vNJNLCVtseJuJKIwpSUBSa5UsXU3SYTSdCeYYpGMyLwn/8ZtkJvjM5kVPMNBEqjgIOL
 hvsWPZnKzJLGbz5b/9OI8+L9yaReog1BrP7hmvgCp0C1rZXWKQ5r0c3b1JAjtvUOebc4dseDEUi
 hfjQnHwUqIW7TaV0mfE0xPdXZSOcj4GGZ5rFEqaKXRGQJYtIhKjUHfSgRKaVQkrtIAVc9rSWrmu
 6K2/PKF6J5K6yA9fRNgYkp9FoHOafYCGwM733T+o3lWka9Ei4HtvP2b/9nxGSDteIm4bAUHR/z7
 DTScIjZH8igdPvRYFv+CbhD6vdKDTRDHvzpKwQAPrObzFJH/aUOiHvjNkro1y35DCos+RKF3W5V
 Ji7iR1/33c7Tp1T1Pg+yy9/YFveKUOXTVDdJiVF2Su0FWyfSdXfs+rAvtutafpCBhIdUi6f29PX
 Tc4q6V0Aib0+TXdo92tEJM6nr9YSbYqrdiI
X-Received: by 2002:a05:6820:1b0b:b0:6a1:42b7:1e15 with SMTP id
 006d021491bc7-6a39a55e354mr900142eaf.14.1783729040170; 
 Fri, 10 Jul 2026 17:17:20 -0700 (PDT)
Received: from [127.0.1.1] (fixed-189-203-100-56.totalplay.net.
 [189.203.100.56]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6a39af0e953sm651312eaf.3.2026.07.10.17.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 17:17:19 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de, 
 Anshul Dalal <anshuld@ti.com>
In-Reply-To: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
References: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
Message-Id: <178372903629.2905849.17715604108602528341.b4-ty@konsulko.com>
Date: Fri, 10 Jul 2026 18:17:16 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.3
Cc: Peng Fan <peng.fan@nxp.com>, Yegor Yefremov <yegorslists@googlemail.com>,
 Tuyen Dang <tuyen.dang.xa@renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Jimmy Ho <jimmy.ho@sifive.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Marek Vasut <marex@denx.de>, Peter Korsgaard <peter@korsgaard.com>,
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
 Angelo Dureghello <angelo@kernel-space.org>, Simon Glass <sjg@chromium.org>,
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[konsulko.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[konsulko.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[nxp.com,googlemail.com,renesas.com,linaro.org,cherry.de,rock-chips.com,collabora.com,thingy.jp,ti.com,sifive.com,gmail.com,denx.de,korsgaard.com,arm.com,bootlin.com,gmx.de,mediatek.com,samsung.com,mentallysanemainliners.org,microchip.com,amarulasolutions.com,altera.com,iopsys.eu,infi.wang,amd.com,risingedge.co.za,nabladev.com,andestech.com,kernel-space.org,chromium.org,foss.st.com];
	DKIM_TRACE(0.00)[konsulko.com:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1684C73FD05

On Thu, 25 Jun 2026 08:47:06 +0530, Anshul Dalal wrote:

> U-Boot does not support modules, so having tristate options is useless.
> 
> Therefore this patch does a blind replace of all tristate options to
> bool tree-wide.
> 
> 

Applied to u-boot/master, thanks!

[1/1] treewide: Kconfig: use bool instead of tristate
      commit: 199a088b96c9d352cffa59ce4043e5ac60917697
-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
