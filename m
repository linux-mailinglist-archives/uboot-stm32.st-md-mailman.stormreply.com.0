Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2334A573
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Mar 2021 11:25:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 464B6C57B79;
	Fri, 26 Mar 2021 10:25:02 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C55F1C57B60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 10:24:59 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id y5so4600912pfn.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YmeaX32HiLaY5AoBitciOm9d0pLa/RPLmpVPSoi9hxY=;
 b=inO8u671JV/h3LB32qHNcmYpslZBJ1VTprn/PwCI8heaGwfC/wMOuduQVMXkVFdi0W
 aWZI1pPAFO95dHz9vFfukwu7MvfJsPQlGSMfuw1fUIlZownMkZ7leUUyjixM3ZhrPCQx
 jE8CyaXR6TIe7+zKqOP7h9QszzcJkotgjffRSKjxwY6IM7Rv5miaT95LlhF7C9W4fqx7
 RTtYcAl8ZIMIZ73Ll1x9WS9SiPYb2JrLl+pBp8WyY63ENvwdgIoDJV9cB/4j9y9QNh99
 wF0qNKDBy1fbH2QtlJZ5bO4HELTSbGAtjRFut8kpxgyPN4RQmtjYRd/mo7FMCfxvX5I0
 0zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YmeaX32HiLaY5AoBitciOm9d0pLa/RPLmpVPSoi9hxY=;
 b=eoX3oR7VTDUbYFrhbhH1o7pTKFeHTWGk5XI65yMwsymILBbp2O2+LVcc/fOiATZ1uo
 eCPZ05S+LWy+qExivV+m5Rvxy7/I0YlUVbDHzfvoVYVkrVkH/O5qyAItz7iC5e4Ifj/E
 OX46DGzFUc/PfvvtTsDB1R0zcFbZkpbpn54795ijHE6VoX30KDZP1H3Sz/JGWT1I8/U7
 UfjOBFiAMWw4r9AeALBUx24ZUxW4B80MmbLLW4bEt30ejNahpysxojCUHUPDWPFYCKxq
 g5IHeLf1QWRkPxFubkgzD6j7aznsmhLaHEUrhajCwg97zlvjr+sU3kFojFroFLHtlI3a
 V6xw==
X-Gm-Message-State: AOAM532PaNi1qm9jmrU1SgVbkqj65H4AYT1JOx8H6AAr1Cc4c+e+epjp
 2+W7fj9KR1evkQTyJKuKwro=
X-Google-Smtp-Source: ABdhPJy/fhFmkWV0D5dT5QspC11PhYFcPiyysqXL/BzPtSxWeI0AhRg7SzpmiPBW4TTAMUbWVtUfvQ==
X-Received: by 2002:a65:4542:: with SMTP id x2mr11353606pgr.53.1616754298431; 
 Fri, 26 Mar 2021 03:24:58 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id ds3sm8126595pjb.23.2021.03.26.03.24.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 03:24:58 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Fri, 26 Mar 2021 18:24:27 +0800
Message-Id: <1616754267-13845-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
References: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 6/6] pinctrl: stm32: Add st,
	stm32h750-pinctrl compatible string
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

Due to DT kernel synchronisation, add new pinctrl compatible
string for stm32h750.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

v2: first add

 drivers/pinctrl/pinctrl_stm32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 6c98538..c5279c4 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -491,6 +491,7 @@ static const struct udevice_id stm32_pinctrl_ids[] = {
 	{ .compatible = "st,stm32f746-pinctrl" },
 	{ .compatible = "st,stm32f769-pinctrl" },
 	{ .compatible = "st,stm32h743-pinctrl" },
+	{ .compatible = "st,stm32h750-pinctrl" },
 	{ .compatible = "st,stm32mp157-pinctrl" },
 	{ .compatible = "st,stm32mp157-z-pinctrl" },
 	{ }
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
