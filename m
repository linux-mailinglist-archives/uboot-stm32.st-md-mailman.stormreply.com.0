Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2B434C21E
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Mar 2021 05:05:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11E9EC5719C;
	Mon, 29 Mar 2021 03:05:26 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECB84C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 03:05:23 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id m7so8513532pgj.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Mar 2021 20:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/KNYrgzoULjCaqaLFKJCMM6mt7cPwjMSVczAX0c5MQo=;
 b=I8zfTfybm0tZqFsGWtNqUpwTSHCd7bTTmBlfS4sVDVl0jWTS/E03HARhaXduAQBGOB
 W1Kq1DhxDAC0TurqWy1TjUcWXQ7CCFTfu8946vSBb5MVGiXoiWIxIqUMZ5FjBJpNwPsZ
 2KqVyPhXo8RvKRrGtqIgBKnYC/xNGxPcFexOrkmaZtJqVxem51f5KCXNRlaZ/QbReiMU
 UuTI7PuUdPh2gt9X/ioihUyzO/Y3mcsb1KJ/2PN1vc9bGX3pYTp7IIpPvcxMYlVRhl9B
 2kLJlUa0y4F2xWoPU5xHam8vopcUcb00xVSsC/W5sN86HRnswlBdfScIRRkic1nf4B8O
 3BDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/KNYrgzoULjCaqaLFKJCMM6mt7cPwjMSVczAX0c5MQo=;
 b=ZcoltNweduzU6KM7fsxKXhry4Pg7lXnnKrvousBP4P7aAEZTneU6LeLlGI00vxo6Dn
 TOtiw1ThmFO3bZ5gkoGRdKgmTzq1pxPJfAH8K3QpQTnmM7nJUNNMk5qT00D7IiTQ5EoO
 vRiTZBrOzKzMii7UW0Z5JUcBGh8pdI5WuWKHtc3SZlNqFXk4eLe5gg4N38nQ6TFFSWok
 uIxPiEcm7aO89NuSSP+pATyNGhJqsou+VXtNYsSxxN7445eVRu7IM/nK2/SrfP917Rt8
 Lj34cMPM2mIJp8csuFQjuWmtlpHCjgoaA2OoPXOYeptSiI846xmjwJqBVjRlj7+nUqJE
 9QQA==
X-Gm-Message-State: AOAM532ouxKU8c4BEGKPs0YOOp1VVcTfaz/t4AdFIninzgzigfmogzjz
 FN+a4lX/FSwHb8UFOhyBxdk=
X-Google-Smtp-Source: ABdhPJxSxhoBkQh/YpfijAL2s6dRPcnd3V/NSHix0XA+RigzFydwK2GMcC7IH5taL9eTJLQO0baE3A==
X-Received: by 2002:aa7:9984:0:b029:1f8:b0ed:e423 with SMTP id
 k4-20020aa799840000b02901f8b0ede423mr23126074pfh.81.1616987122624; 
 Sun, 28 Mar 2021 20:05:22 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id a204sm15331914pfd.106.2021.03.28.20.05.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Mar 2021 20:05:22 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Mon, 29 Mar 2021 11:04:51 +0800
Message-Id: <1616987091-3432-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
References: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 6/6] pinctrl: stm32: Add st,
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
v3: no changes

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
