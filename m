Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD61B1D565
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Aug 2025 12:04:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 399DBC3F956;
	Thu,  7 Aug 2025 10:04:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79AC4C3F954
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 10:04:08 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so5096215e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Aug 2025 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754561048; x=1755165848;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MH3TF5/YN4Hlu7k7zMMLjhGJygDR5pgvQMYQq30nvJI=;
 b=dDinB5Op2MnF6Acpz1Nad3wXf75YnthYIEr5cNbQK5F2nkut3T0PpuDumNXQ2Z19G5
 jMbT36iJHr4vInfCrRGLiN5zeJPU6ieY9R8TOeKx9Cf8X/tvapnNdcZjBHKPBObU0ZfD
 d7+e2bHJ7w96XRC5psbFL7Pl0WeAVbSvFeWQkfea9X+BXlL+bx9d8FsW5cd8DuFknYnZ
 WOJP99GEd9UjpSThe/ZR67R3w6Xt1aWfw/dCE8DO6mavnrRgS7RQKBonWd6GKAhG/o9R
 4EtFOWWEqwvQJLvz0/3MPIfCACI6uw/n6ducN3ZIpTPO6DrUUo1N/LebuFRPI9m+qZMB
 N5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754561048; x=1755165848;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MH3TF5/YN4Hlu7k7zMMLjhGJygDR5pgvQMYQq30nvJI=;
 b=vWQ8bNbggHUWn1+Mu0ubGlCPJCl1yJjnBrCnUqt5+NNOBtxkGcAKFrmG7k11U81720
 yXtRo7uOPN+HcnaDe8E51+NuZtp2BspiRP2tW3LxbiVnvaG3kiiDbUiYuEIbbc2Ga28E
 XlqVRLywr+/3gz4tpgTM0FCikw2rw8KPKfenWZxi5qJAFAZe2QuDXXZQRDsC3Ghs2YfY
 h2elrJNicYeXiSU+Fc3HxGr07/P/QCI1khzlm+zj11g2PvfZ7PMEp7LXrgbcU1xU9x7o
 BMlR72KPyN3CgLliTbguSRPu2Ew0RZuSsNFw6J45R0E1UoDmLkp8QBDbhHwGCOf+f2m9
 9r3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp3Y1yoPFAHBoKMLU+L5CS902AwndbDm4HDnlpstK7lEdCN7WpQvYyKUH6Mf5rSHW7u7bm8eQGslw/ag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzvbwriz7/Tq/uUx/e/iWFeH47Z3SaPvqFHRi8Hw7gKd7hIfRcW
 g1YZcHFoTJzzhI6lKqL+GJuf1RsL1+CEsX4yCks99ANxDwJbmgz0LP4tLQ7jgL8A/vg=
X-Gm-Gg: ASbGncvP/SE6WFy9G55FXIroKWfwSQgxVN3URAdLsX1KODD8MYLcfu6orxSrVud/Luq
 MuPUUVoWvonD/Xx4uEBmsTa5x8AniKy6lgnUNU0S1jvjSjqu9+sEKqjdnQTSrwCLX+6eScLLwj/
 2/ubXhu9bSAaXeZuO6YF2iUApkS1Weiv59skHaJuRqLMt6v1MrffAK/6/36nza/MholTEyRKziw
 E4N1MaqdmCFLMz57FFyIvNksRsvjH/oLmgBw7CSvMRqI3DFRbN3WmEpxKQblg4evevvW9j5E4Qy
 hpzjdDW7VucUpqdXvj7BZgJoUizp0cw2SvVrNAlrTZCS/ov+k2Ey9S3SowHGg38UbLqB6O5ywDJ
 9iLjmTs6V8BK06dD395H5bXtc/OlLkrnguwvXS2t0TPw9MLoQnrDd/JSGJOvoRg==
X-Google-Smtp-Source: AGHT+IExm+su1cnyCFtPZpieI0b+diInV7z0DG6JrkXUwhKyIIwdmRm3Rbp5AzaM60RP8X4UGU5Owg==
X-Received: by 2002:a05:600c:1d25:b0:456:1904:27f3 with SMTP id
 5b1f17b1804b1-459ee85db8bmr22084485e9.18.1754561047925; 
 Thu, 07 Aug 2025 03:04:07 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:f9e:3c01:377e:cf4f:d0ff:80bf])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953eaeeesm358481575e9.25.2025.08.07.03.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 03:04:07 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Thu, 07 Aug 2025 11:04:03 +0100
MIME-Version: 1.0
Message-Id: <20250807-pinctrl_misc-v1-2-eeb564a1b032@linaro.org>
References: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
In-Reply-To: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
To: Tom Rini <trini@konsulko.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.12.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: [Uboot-stm32] [PATCH 2/4] pinctrl: stmfx: Remove duplicated code
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

In stmfx_read_reg there is duplicated code to detect ret < 0 and return
ret if so. Remove one version of it.

This issue was found by Smatch.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
 drivers/pinctrl/pinctrl-stmfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 61f335c4eb1..0d5778faef9 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -87,7 +87,7 @@ static int stmfx_read_reg(struct udevice *dev, u8 reg_base, uint offset)
 	if (ret < 0)
 		return ret;
 
-	return ret < 0 ? ret : !!(ret & mask);
+	return !!(ret & mask);
 }
 
 static int stmfx_write_reg(struct udevice *dev, u8 reg_base, uint offset,

-- 
2.39.5

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
