Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD2DB1D563
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Aug 2025 12:04:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DE05C3F951;
	Thu,  7 Aug 2025 10:04:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1533BC3F950
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 10:04:06 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so7365095e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Aug 2025 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754561046; x=1755165846;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=thuwGn6BhdyBIfsoa4lR/ZAVU7jk6hrXQ52uW43ho2Q=;
 b=gjJyiYiNqPFd/dfFd7qn+csSlXfCerL9QCr7nlIjCUOOrdPG0MSN+qDozUqHfMvyAh
 VcG+nRqayLcqiFZ9WZWzwkspv/RhxrpJn95QaB1t9jlfUcKKhpQiwjKINe8PFIkis2re
 xMvIWXC1Ays7e98ys7o1KwF689OLo6e7z6tWI4RnrgucenjysQ1r2I//i3LTZZGwVrP6
 j74UV6Us9Z3s7F7vIKr9qH5+x0cdzA1O0zYzB2FPIKecNBwb8IT0dxKfZDw8fFIEfuOt
 7ntg4BSRnhOWv4GiArtrsDOWIxRfUpFquNzRBWyFxxz0K6dBPyVuUOzDwqFEKgl7WMl7
 zmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754561046; x=1755165846;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=thuwGn6BhdyBIfsoa4lR/ZAVU7jk6hrXQ52uW43ho2Q=;
 b=Cl4QfLbJ9jwb9k7qIjIhMPnHW9Wyhh/4/kUqIKBi+5CyxFdKGcMZIk7da5wmlLdwnC
 hvOyby/w+TGE2SrvpliaVoutL3hMIPuwSDTaQfMxN3nvjnyFAbxchh7flQJGY6UEWU+0
 B1XgCEx3YvTGCad0FJEfbUzAC2y3Q1RGacKU91z1wzXCT4nv2PHQE4dUz4Eeq06uS46E
 WU3D+mP+7lUH1rbEs68SDBnpxijcIaLkih30a6LwXmd8q34LSy/eqNUPhZUk9Ljtzi80
 gzPpFMBY5NGE5ZBSCOLfIaWNVuIt+NQF7/HqfCkQZBQU5mOZlNAlHOpoR0inz0Biuazp
 4cjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZEkD/mAzrsO3ra6BfRO6k4XDFXKQTN7K+0o8pv1+nZKGmbqgNGKpJuTHwetMRzbxLciFyYgfxuLvWEg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxZ8cNrDvTPXPvpBc326g20Ev/0Qgc+jNlIInbfmoF+R5YXwtgz
 xNmrgTh1KfUIJ+lEpcifdjJKa4DR6iahNtuJvmZCwpubeeBK0TNnBmBM+gyPghFRdtI=
X-Gm-Gg: ASbGncuMec1Kptp/1QXelfqLiOnmVLvVsntY11RLQU8DHiExCAcqqR0FlTwijHlZFGK
 5TqVeBrv6un6m4O9wJ0ni0HTB82nsP2t/RMrwBzTgs6c5Ex36tIWRmIIqwpZxOlfiiRwthTxmVo
 DsQdOg96V4ab1VKrBTosbxniCcciC4KCbROc0hNon6OBtspuR8TIw6Pduqs9DtFFe3fTuLpP+Yx
 aT9UPWk6iXejXuXfwv0WxZsQnO0sDFHa8meNNU+YKf6sVdCZ3CtgljLIaK4ZtR4lbR6d9et7phW
 G7Ot2JqKGXicN4G0jCQum/s3FbUxo16p0vlGgRjOaA+RWPSNLJjjbBo+N88tdZEoPtMoCXq6yZ9
 a8jf47vH2TQLarCAuQwRl5n5mfEEhJ77F58wSVX8j6bsHUDo+Mpw=
X-Google-Smtp-Source: AGHT+IGlUNKn+xWxODn+yrPJiO8FKrHAW7ta4nivZYCj6/4OyVCgbHLW6Gf1kYrI2ZVsaIug3s7uvQ==
X-Received: by 2002:a05:600c:45d0:b0:458:bf9c:274f with SMTP id
 5b1f17b1804b1-459e7478234mr51814065e9.29.1754561046325; 
 Thu, 07 Aug 2025 03:04:06 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:f9e:3c01:377e:cf4f:d0ff:80bf])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953eaeeesm358481575e9.25.2025.08.07.03.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 03:04:05 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Thu, 07 Aug 2025 11:04:01 +0100
Message-Id: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABF6lGgC/x2N0QqDMAwAf0XyvEIVndVfGUPaNGpAqyQyBuK/r
 +7xOI47QUmYFPriBKEPK28pQ/koAGefJjIcM0Nlq8Y625qdEx6yDCsrGhfa2HRYPl0dISfBK5k
 gPuF8R6vXg+QWu9DI3//n9b6uH/CVVLB3AAAA
To: Tom Rini <trini@konsulko.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.12.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: [Uboot-stm32] [PATCH 0/4] pinctrl: Address some issues reported by
	Smatch
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

Smatch reported some issues with pinctrl drivers. This includes
unreachable code, duplicated code and uninitialised variables.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
Andrew Goodbody (4):
      pinctrl: single: Remove unreachable code
      pinctrl: stmfx: Remove duplicated code
      pinctrl: zynqmp: Ensure ret is initialised
      pinctrl: zynqmp: Avoid using uninitialised variable

 drivers/pinctrl/pinctrl-single.c | 2 --
 drivers/pinctrl/pinctrl-stmfx.c  | 2 +-
 drivers/pinctrl/pinctrl-zynqmp.c | 6 +++---
 3 files changed, 4 insertions(+), 6 deletions(-)
---
base-commit: 3526f990b77fca1c933f1d8b24eb9385010a05bf
change-id: 20250807-pinctrl_misc-8b7d59c1684d

Best regards,
-- 
Andrew Goodbody <andrew.goodbody@linaro.org>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
