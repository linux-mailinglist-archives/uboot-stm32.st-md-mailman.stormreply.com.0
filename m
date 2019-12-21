Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A4A12E3B6
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jan 2020 09:18:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 264CDC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jan 2020 08:18:11 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9A90C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Dec 2019 02:03:47 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id m13so4923802pjb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2019 18:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9RI34rz99E+BS9F42TZllD4HxKir/yKWPjI+iQKTnFg=;
 b=qIuTz+ULfdlm8zi2KszedKrfkYfOzzcDwE4QL20SdVxhsXoOML7XUq9MzAgX/neZQ9
 j2YxwDHt4/5JQMKg7KaYrhGI4rXKAerHlNBP7Xzu+eoT4HbNkijIK6QH+epGEZdKAMVJ
 1UqhjoF6Bv78NJ4cWUTrCPdH+sDS+EWYLZmpTRrpK2J3Ez/oh6UWRjoEXPzqKl6PMMNC
 ud04/RGocp1kNV7SUzvjQp7C2v819dCw0L4lEsyHVwZsVOBdR8PdiLDXVOeUGCj4aQi+
 wR9VU1dKIcQK6xN+W3lMAaAw6wh0G1E/YStGYsbTHIzaO/66jBp8kbI96F+Hv6nGR5zp
 YBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9RI34rz99E+BS9F42TZllD4HxKir/yKWPjI+iQKTnFg=;
 b=ju0qCrZD3xjek0bQ0TWrX1tGRhOHDJLwun0EJVfPL66bWREiuTrdstJBhttenTdBJY
 FVbxt4lG1DPTl4qToT2hfu9nlCrSgljdCyvVYCzuv4yI8v1UPKR6YmMhwHOeyp5h5wR3
 1PbNUVyet69iRZpV+gOXioGR3sEw+YgPKIL2vWeUM7P/gSfTeO6p6X0jPqEeKApD6wAs
 zWsuXaovuhvHg4sgESYGTLP6OULlj3bTNNllQfzl+B9idN09Zr9RYdK3L6ihigXkwhtX
 dMw/1A3I6Xwa2PK3FOq1bY+oRggCE/NubizRn0n/hWBJjX92xLVGBgMSe+wjbk/0sT4r
 IK2Q==
X-Gm-Message-State: APjAAAVahEw8s88HvZ2tSUtViyvkfcGBVr8l6PE4VnVTu4lHq8EhUA4c
 OyHWHpZ4dwCVJ7BhEeSqCrg=
X-Google-Smtp-Source: APXvYqwloVWlScKdJhEq3nGlD6Q13mrN0mIxDfzwoNEyOfZ2ZKn+UnmGZmScxy9foFWizbY/6k11nQ==
X-Received: by 2002:a17:90a:17c5:: with SMTP id
 q63mr19120387pja.138.1576893826253; 
 Fri, 20 Dec 2019 18:03:46 -0800 (PST)
Received: from glados.lan ([2601:647:4c01:6541:fa16:54ff:fed1:1bd6])
 by smtp.gmail.com with ESMTPSA id g19sm14933515pfh.134.2019.12.20.18.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 18:03:45 -0800 (PST)
From: Thomas Hebb <tommyhebb@gmail.com>
To: u-boot@lists.denx.de
Date: Fri, 20 Dec 2019 18:03:43 -0800
Message-Id: <83634bb5ffff308a693021bf2729742c0b30b2cc.1576893816.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jan 2020 08:18:10 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, Thomas Hebb <tommyhebb@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: remove redundant SYS_TEXT_BASE prompt
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

The main prompt for this (defined in /Kconfig) is visible at all times,
which means there's no reason to have an additional, machine-specific
prompt to set the same option.

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

 arch/arm/mach-stm32mp/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index ae28f6e206..bf8a18a0c3 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -80,12 +80,7 @@ config STM32MP1_OPTEE
 		OP-TEE monitor provides ST SMC to access to secure resources
 
 config SYS_TEXT_BASE
-	prompt "U-Boot base address"
 	default 0xC0100000
-	help
-		configure the U-Boot base address
-		when DDR driver is used:
-		  DDR + 1MB (0xC0100000)
 
 config NR_DRAM_BANKS
 	default 1
-- 
2.24.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
