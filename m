Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BCA34A571
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Mar 2021 11:24:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 177E7C57B79;
	Fri, 26 Mar 2021 10:24:57 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFB84C57B60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 10:24:55 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso2250296pjb.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 03:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1V1pY1+fkkMxvafvIwhRW2kEl8W5l7nXCTplRi0K/+0=;
 b=tC0swV7OfW5wsVkExvC+i3G0xzrXYoHr4eNyPcLleJ9YAYZTy53M+N38EPgqE3+I7F
 9mowf8tx7uHNS76pgazDC3GrI0tIAGu0Frd6cTRrPwQvF4b6CY2kBAd609puzqZ0+vlE
 lBtOcDj3A7a5CDHm9StDUJWQ1nm1ROneq2ModY7iweMTPnWhDFFRk5iB5v1hHnqX2VcL
 7lbXDQ2F15TOt9Dw8DMbImpe9Cr5pc3gL+9hHX9iBqog3OaNA2F6hvKuWdveNc7mhbRh
 7h/JOizV0h2leoZlMTwmMJtvQNHqV3ZKqkAeXNv1oi5AuLp01fvw2ZMu9NvEypANnJcE
 +G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1V1pY1+fkkMxvafvIwhRW2kEl8W5l7nXCTplRi0K/+0=;
 b=EsDrXSs4O1sx/vFFYI3DMBw7vpWSPkt3xn8Em8yjO/QFKlRa7bnLnp+Slha7CBNl2D
 gWSGfstQoYoy83lpcnTKzvBVOgJT7rHD9iBpk5Xa0smrXZ6QeCIRSTrrYsLLm/RatP8/
 vYiWQ8W/yOcH5RIP2aAYjKDqig6xhtKWsHpax9Nw0cTvlAcfYZMhQPBMoU7T6CU2IvPp
 fVaVpRrLRhjngM/WrcHNxkENQMaWkh6AP3r/1RO5tk6R09hHQ+sbkwXdfOvS6E8DZBgG
 YrmRZOneYaDY4KPKmMQ4lb2dNu73osSgE5nYIXbR8AAbJJWudQUr3slX4SXj/wamdd4L
 I3ng==
X-Gm-Message-State: AOAM531G7rJSQ/wMPij4ULav/ovB0K2dHLpmqVpdOv1IMbgdNX1iSUeF
 S3nBuSxgucbc46/8cVzfTdE=
X-Google-Smtp-Source: ABdhPJwwrgpS3W4975X9sYvJv20zJXRZB10NtkVRbpJ8lgWkKkNHnL6w9CjBz89Q4CpiwOYvbD9CYA==
X-Received: by 2002:a17:902:d895:b029:e6:f007:5bc with SMTP id
 b21-20020a170902d895b02900e6f00705bcmr14580526plz.76.1616754294466; 
 Fri, 26 Mar 2021 03:24:54 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id ds3sm8126595pjb.23.2021.03.26.03.24.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 03:24:54 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Fri, 26 Mar 2021 18:24:26 +0800
Message-Id: <1616754267-13845-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
References: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 5/6] dt-bindings: pinctrl: stm32: Add st,
	stm32h750-pinctrl for stm32h750 soc
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

This patch add st,stm32h750-pinctrl for stm32h750 soc

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

v2: first add

 doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt b/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt
index 0016925..472539c 100644
--- a/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt
+++ b/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt
@@ -13,6 +13,7 @@ Required properies:
    "st,stm32f746-pinctrl"
    "st,stm32f769-pinctrl"
    "st,stm32h743-pinctrl"
+   "st,stm32h750-pinctrl"
    "st,stm32mp157-pinctrl"
    "st,stm32mp157-z-pinctrl"
  - #address-cells: The value of this property must be 1
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
