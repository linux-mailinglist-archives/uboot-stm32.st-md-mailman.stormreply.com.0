Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC76359661
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 09:29:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0683C56639;
	Fri,  9 Apr 2021 07:29:21 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 159DFC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 07:29:20 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d124so3638972pfa.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y4M11X15i0Bp4xMyiHxKNtu/p+u/Lz6TbAiq1qNsDk8=;
 b=JgxZ0qZvYIe+zrCR820Ut+5a1k8OWogxkG/xun3jtSxHgdWqJylE+Y1IVxtJ+IPYiM
 xrJAKfGfR/FPemqlNvE+U8lxTeWZQ0vf0zWC/wFiGTsraFJHqMntuPlduLSDm+YZIUNr
 Swzbdm1XjeAmK7zoni1YvD3Kb5l4zO3/kl8R9E7h07+ePwUAh2TpkXqItg2XMEhCL4Tu
 vNOxYCbEwCg+ZHPmonoyyEMEFbj3jQGXKOWE06/C7PErnnXa+yMMNF55JFsBriipo2Ky
 GJ+K9vbDRyhnuRivC5Vuki/sbZ4kViFsFnBHXFY+KgoiN5wHEMDJtEPAI96KJ/lXoF8H
 d3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y4M11X15i0Bp4xMyiHxKNtu/p+u/Lz6TbAiq1qNsDk8=;
 b=ruR6KhalFlgceNW+eT99LyFvzDvpEcQIWUGpoyS3uSc0j2ZL+DICumxkx5m2kk7Gwh
 LdB6Zm3Y30A6Q/aKZfdQ78b0iPyE45dxiXY6ipHDAbMS44DcmKd5ZM8DU1BZCfDieB4+
 5KTXfUaRm5kaxoA1HPBJIf95RJI3Ny66WWsDk/ujIQk0p4u0jjbcTUPzUfXytSTN6ffi
 KwkHrbCIMtH6Wo60rF3F/BJnSLvWfDxc42cQ9sZCPx2N//C4uB8hBMT02PUsjiE2duW2
 qzBANPB+CgLKtZXJBh+XBEr3nWtwC+CqnQoH6ypLwjt2/+uvFBBrLX1kvdPPJkLBec/K
 ZwHQ==
X-Gm-Message-State: AOAM531jnlU1gPchHPMEFudD39LtiRifz9zGwhGvWSQUADuAI4CiUuXy
 fZ7k1kWIwpZV5Ieq5JsB/M0=
X-Google-Smtp-Source: ABdhPJxU7NnkNQ0GHy0G2E2rBsAsdBqT/A8Ztc568+AFRDQITzop6/k9udOHe+FSp7EFyiMmGWc4ag==
X-Received: by 2002:a62:8c13:0:b029:241:db2a:11b6 with SMTP id
 m19-20020a628c130000b0290241db2a11b6mr11437407pfd.74.1617953358724; 
 Fri, 09 Apr 2021 00:29:18 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id j3sm1344432pfc.49.2021.04.09.00.29.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Apr 2021 00:29:18 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 sjg@chromium.org
Date: Fri,  9 Apr 2021 15:28:45 +0800
Message-Id: <1617953326-3110-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
References: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v5 6/7] ram: stm32: fix strsep failed on read
	only memory
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

strsep will change data from original memory address,
in case the memory is in non-sdram/sram place, will
run into a bug(hang at SDRAM: )

just add a temporary array to store bank_name[] to fix this
bug.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
v5: no changes

 drivers/ram/stm32_sdram.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ram/stm32_sdram.c b/drivers/ram/stm32_sdram.c
index 540ad85..3e25cc7 100644
--- a/drivers/ram/stm32_sdram.c
+++ b/drivers/ram/stm32_sdram.c
@@ -268,6 +268,7 @@ static int stm32_fmc_of_to_plat(struct udevice *dev)
 	u32 swp_fmc;
 	ofnode bank_node;
 	char *bank_name;
+	char _bank_name[128] = {0};
 	u8 bank = 0;
 	int ret;
 
@@ -300,6 +301,8 @@ static int stm32_fmc_of_to_plat(struct udevice *dev)
 	dev_for_each_subnode(bank_node, dev) {
 		/* extract the bank index from DT */
 		bank_name = (char *)ofnode_get_name(bank_node);
+		strlcpy(_bank_name, bank_name, sizeof(_bank_name));
+		bank_name = (char *)_bank_name;
 		strsep(&bank_name, "@");
 		if (!bank_name) {
 			pr_err("missing sdram bank index");
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
