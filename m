Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE48741038
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Jun 2023 13:42:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4DCCC6B443;
	Wed, 28 Jun 2023 11:42:23 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1B65C03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jun 2023 11:42:21 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-51d946d2634so4364389a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jun 2023 04:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687952541; x=1690544541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8AWfrG++fqqTuDHMRp3DqB9lcTtS9Z5G+x16SCr6Me4=;
 b=eGQ1Q8jJCkXMFcYd/EXmlhsVs7gt0nmchXT50FZONQpBTEZKMMepIxYGnUNpc8zqoO
 wOx7cxTi8e+8F7CuFu5svBayEY9mqzISE4bUol12kMWFr7Eetb+bjvxrcdw9C6ORH5HF
 1qwdHKDVSuIL6SruLb5bS1X7IS+CHwMG4rgfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687952541; x=1690544541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8AWfrG++fqqTuDHMRp3DqB9lcTtS9Z5G+x16SCr6Me4=;
 b=iNne1+vwO2qN/NBW5Q8Oz7SbJZ/okXTI6JUfq0eqkKVZ/g0uwvX6FZank6E7xucyki
 jXyRiB8gW1ZgC5FOyAsnPTW6NJl536vv9Nm+SufX7vBLH95/UCWr2hvafRxKWj+I8zTy
 X3eoOy4QjEPMbD67WZif2YLqQuLjXRVYY2yOnyHH31KPZxKcambBdboPukQqigObuvo4
 h8Xl0ZFoSt32B7AHZtKL1dsjQRvGKFsuXQkv1UFaef2Mwx5zU7LHQlYW6yurdpQn1VEq
 7I69D2geI2q0VTAplTQ5d3Db+Viu2shRMXxqtenUJM5xyDCaEJAVq1yYnVci9XybMiOE
 Ef2Q==
X-Gm-Message-State: AC+VfDxmWKvbGdYYCc64SRb88Y2oT3kpfgxqm5djvG0in0iEH1pZdgAK
 LduA5ze1h2CbIdQ437lB4CKmag==
X-Google-Smtp-Source: ACHHUZ6JHmhur9mgdUlkJsw/ZhuCq7XyOyU4UfXGpRKNqdRk8HWqJqOueiXSU7tRWnf/iUJkiqCU7Q==
X-Received: by 2002:aa7:d9cf:0:b0:516:459d:d913 with SMTP id
 v15-20020aa7d9cf000000b00516459dd913mr26308503eds.37.1687952541498; 
 Wed, 28 Jun 2023 04:42:21 -0700 (PDT)
Received: from sjg1.praguecc.cz ([193.85.242.128])
 by smtp.gmail.com with ESMTPSA id
 r18-20020aa7cb92000000b0051bec856cb4sm4676423edt.50.2023.06.28.04.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 04:42:21 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 28 Jun 2023 12:41:38 +0100
Message-ID: <20230628114149.439723-6-sjg@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230628114149.439723-1-sjg@chromium.org>
References: <20230628114149.439723-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 05/12] stm32mp15: Avoid writing symbols in SPL
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

These boards use SPL in a mkimage entry and apparently access the symbol
containing the image position of U-Boot, but put U-Boot in another
image. This means that binman is unable to fill in the symbol correctly
in the SPL binary.

This doesn't matter at present since mkimage doesn't support symbol
writing. But with the upcoming conversion to a section, it will. So add
a property to disable symbol writing.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/dts/stm32mp15-u-boot.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index d872c6fc5679..573dd4d3ed56 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -226,6 +226,7 @@
 		mkimage {
 			args = "-T stm32image -a 0x2ffc2500 -e 0x2ffc2500";
 			u-boot-spl {
+				no-write-symbols;
 			};
 		};
 	};
-- 
2.41.0.162.gfafddb0af9-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
