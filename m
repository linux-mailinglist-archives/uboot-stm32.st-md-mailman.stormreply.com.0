Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B218A3824
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Apr 2024 23:59:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DE1EC6C859;
	Fri, 12 Apr 2024 21:59:35 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FF84CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 21:59:33 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1e2b1cd446fso11042845ad.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1712959172; x=1713563972;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nKOCz+yhYB2Xe4HsAT0WVhW4VR9g81Z/Zm2fkLKmju8=;
 b=MZHE9BIaL644vWwbYOoeVxz8y1LTVACTInfXcYs5TwJ5y9m8r1PKpHcyRcC0S6aGPF
 nkHLMM45AMjgfn+rvLY+N0HFJK62aTThn5uGykUZyGw2ApZCHommyawu57rClbrQXpD7
 ijBPVwoTuWc6OYGIlQnrcL49nTTXhPoG6K6qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712959172; x=1713563972;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nKOCz+yhYB2Xe4HsAT0WVhW4VR9g81Z/Zm2fkLKmju8=;
 b=I1YE1NozfTt0D1BSYr0SKCXYWWO7v9S4c5dhuMqVNgwkjJPBXbBBaX6H/QSHmcHtZ+
 mb9itN9djbNyYvcOfmO6/H3HoDY6ppNUrFCZtuIg/s+ZGUKVRMLPkA0DkxCH/1cycHYS
 9O/KfBczdwfnhALjFzlDHj5hDraWsLcupWD5Q5pYJpFOQlUVOWcSXaH148Brh+TdsWd8
 lKHxSOWiQmrCYSdtdyff1VDOm4nVzq/zbOsCpxIxUKxYfWeFKzbwIHq34W7Wupa6Zz8u
 rofbQtK2c+Vm7WTc0PgU7ic5Zpy6TUK9c7HL2sr5dGWePnCeoiwb9x40yuCIJy+oE15F
 9yfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMxUn+9o3Ml9MbwJEhUxeSCY+GXfZ7pV/y7UKtlZ2i/8NMxsejz3zJr9BJMw8A4KncZ72ZhHS4s2dUpk9XeFP6rKmBRko51hitJuAq0YzhrmEXgX+nS9Kb
X-Gm-Message-State: AOJu0YzEHg+To3RGJ2/d7hMtBw1qU9iKiS/6+Wf1o1I5V43QCk1f5gEi
 G3d9lo7weKqH4MhVCXXXFpRVEWOYTi6QjorlifNmXnoHDsCf259Q7SIqhHu/LVc=
X-Google-Smtp-Source: AGHT+IFe1zuorgmUxK4eXvhDKuneAq+85EkzmL4VYdIWPjtkBh4jSL3Q3G+ebrkjEEJrZPMvQXUUpg==
X-Received: by 2002:a17:902:6503:b0:1e3:d8ae:df34 with SMTP id
 b3-20020a170902650300b001e3d8aedf34mr4186378plk.11.1712959172140; 
 Fri, 12 Apr 2024 14:59:32 -0700 (PDT)
Received: from [127.0.1.1] ([2806:102e:18:245e:b648:93e1:5c61:68a3])
 by smtp.gmail.com with ESMTPSA id
 kw7-20020a170902f90700b001e45240eca4sm3472958plb.196.2024.04.12.14.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 14:59:31 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20240405161529.1419902-1-patrice.chotard@foss.st.com>
References: <20240405161529.1419902-1-patrice.chotard@foss.st.com>
Message-Id: <171295917036.1044279.5551427954733750533.b4-ty@konsulko.com>
Date: Fri, 12 Apr 2024 15:59:30 -0600
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: Yanhong Wang <yanhong.wang@starfivetech.com>,
 Jonas Karlman <jonas@kwiboo.se>, Joe Hershberger <joe.hershberger@ni.com>,
 Simon Glass <sjg@chromium.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Kever Yang <kever.yang@rock-chips.com>, Elmar Psilog <epsi@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: Fix compilation warning
 in eqos_free_pkt()
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

On Fri, 05 Apr 2024 18:15:29 +0200, Patrice Chotard wrote:

> Fix compilation warning:
> 
> ../arch/arm/include/asm/io.h: In function 'eqos_free_pkt':
> ../arch/arm/include/asm/io.h:103:32: warning: 'rx_desc' may be used uninitialized [-Wmaybe-uninitialized]
>   103 | #define writel(v,c)     ({ u32 __v = v; __iowmb(); __arch_putl(__v,c); __v; })
>       |                                ^~~
> ../drivers/net/dwc_eth_qos.c:1220:27: note: 'rx_desc' was declared here
>  1220 |         struct eqos_desc *rx_desc;
>       |                           ^~~~~~~
> 
> [...]

Applied to u-boot/master, thanks!

-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
