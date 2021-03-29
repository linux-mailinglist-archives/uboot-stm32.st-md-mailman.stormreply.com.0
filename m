Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8434C21D
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Mar 2021 05:05:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90C81C5719C;
	Mon, 29 Mar 2021 03:05:21 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E70EBC5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 03:05:19 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id ha17so5332277pjb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Mar 2021 20:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=k/l90yXZ23rI2nR7Ilz/9iga4tzQ2ePmo4hGyYdKpq0=;
 b=ANscp5MWpZysyg0C2lioS7Yzq2MBYh0jSQagUaZ78QpGAY2IP6uIUBMzxTd0msRWk4
 I2Pojdv/YwxRm6vs0pA/0k9+FlZS04wouXC62LK3hFkcuIITQvY8rAYP4ec8Ta6wrwC/
 aKLKd6ev3HhVhskjRr/jhrU8MWfEFj/JDCTmXSzEePVWant2CIb942y5JAdrIBjawidV
 VOtMiflp/k6dfkbEBKfMlfANuY0e9589YX9oz63IQwVpbd4w0KRomC9ty5aK2p0l4S7V
 XCo7fYBwWgWRRrwapY6FyBhkzUicTZuan5kXneOV56NOP0wVidzQSvUPXNKwiDYcm63t
 Z3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=k/l90yXZ23rI2nR7Ilz/9iga4tzQ2ePmo4hGyYdKpq0=;
 b=bhdvX1D3XHvKZ2jTzKJpnBWEffR2S664NX3YmOZHdEwV+xvRk+/GeV+eM3tfydoA9+
 Fp3nR+x3648VkEWDz5iYCwaUfRMzM07BYk/XaVxjqr9QekIID2e6GGpWPK/P3/9Y6mOM
 bdYeOk/5Qy/746YNB48SUfLymfCRj7PHrm4bT01Gvcxul6L2Jmx54hj/4/jRadlArSda
 hZLlHGDpq+Akj/PdkWlQYiMl+BNc39JKkfSN4o9B/MwsczMx8DQElLKHJ8cEbvQnh+AP
 BeJl/uHURDrsBfQwroJj+qOqInoEEw5GFNYuiT1x7Qv8CpcuUGRIwPwqmN3i5KMZp0Sa
 2VTA==
X-Gm-Message-State: AOAM533eKStStQz6JaXTSgoVGtKhJDvg0yopcHquHc06Un8jKQ3kttee
 ZFS2hJ2RNpi9tyVv8l2QqX8=
X-Google-Smtp-Source: ABdhPJwfr4AfFeQcr0EoNtmlo0nlZhydcpz3xBapkVFgvc06ts9O0OwsWqIHux2cMpFor/bn3uUU1g==
X-Received: by 2002:a17:902:7404:b029:e4:503b:f83d with SMTP id
 g4-20020a1709027404b02900e4503bf83dmr26228880pll.35.1616987118579; 
 Sun, 28 Mar 2021 20:05:18 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id a204sm15331914pfd.106.2021.03.28.20.05.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Mar 2021 20:05:18 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Mon, 29 Mar 2021 11:04:50 +0800
Message-Id: <1616987091-3432-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
References: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 5/6] dt-bindings: pinctrl: stm32: Add st,
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
v3: no changes

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
