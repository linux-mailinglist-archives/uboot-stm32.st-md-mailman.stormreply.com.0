Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAA3A18622
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Jan 2025 21:31:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1607C78F6E;
	Tue, 21 Jan 2025 20:31:53 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C11BFC7802D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 20:31:51 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7b6e5ee6ac7so517603485a.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 12:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1737491511; x=1738096311;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9EJrnZv0LO1XhiS3uV1LvjuqLzOt5GH3cqGwHyrIXcw=;
 b=AXk0QqeLLP8S0HyndFry/CU1w8yxH2/yr2oALsO2o7wm07yLrKK0P2dxNekUsvL5KF
 LXuiSnefIwm4HUQEi0IzBEHqLsiJmwqIYsxzKU2IHY0dZZdXz2QACMFgck4KeS6U3kOD
 ZajG3tc4aqmTH1Pm2B7FoNpBrhAXwc5irmv1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737491511; x=1738096311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9EJrnZv0LO1XhiS3uV1LvjuqLzOt5GH3cqGwHyrIXcw=;
 b=lS5lgJlKMeE0nmCgjMjC+LSQKRTXJXZ62akoGIyfF1Cc2qglat3gf2b9iDm/lDbyxB
 ba4j0ntdutNBgEx9/pf7exqKynrnNE2tY1MqIsfGwvehJJQ9TOKEclpCuXq5UT9aZCEV
 LFD4co4ODWDcAyyf0YZvZc+8yCK5SRUeA2p4+c4itctlAQ8RSruLZMPElwo2JlBJhjOa
 2eC4yqvIHufAoj6CASKgoKGaq4VS4nGrwvaMI+Vx44Ichv4+fIQfBpGElzwVzRWS1OQm
 aRdFhAnAHp4j5WC4FU8ERyo02ER/lprBg3AzfLL6hW6+dILn2CqEzxTw3/9a1pFTYXWm
 Klkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzgwOB4Zz5vEPm8Zv+Wmvjom8H3k94T5dDtwPyULQLwGc5t6n2/Vyhn1pAECOquJAuziZZHQUaclsczA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzH+4NABXqqA+jV/IRWNLkkoNqIdhD5H3myyNKSeKeoGXVoWWGb
 0IVmIgii9hH4W0gTigiSQCqMuNscTRoPhVQmGI30Ejeb45/tGAlf+BIm4ogc+uo=
X-Gm-Gg: ASbGncvCRhR9RrXqVsqwc6cT0HQIRiyzefyIUQSb3qNErwR+A8kCiDOBtVNTX2AYdel
 TRvUj1hrzU8UM2Osh8RiIAjrjN7pHvwj/pY4mNrb/eYkv6HX7gSn3VeZwZJG42CCeo4eWL3JWQw
 piO3XpI+CFtBmXT1PZdAt/UDY9pRFt0ib5rTBg7Vs05aqvaK4qqh9ogz5sMwUCgd5XUK01VEpWy
 X8RrV21vp1ZC8YqtxIv41cyv8XAgONCc3AE74gM4rkhS7xQ+Iqw9D6u0UKUV1BRP/i0rpdP6lVY
 ykZXN3p1ZHvoNA==
X-Google-Smtp-Source: AGHT+IHd13/Mi+/FcRN2M4dGTYDp0xi1uorwTGoqrfIOy74dvhsx0xpyl1xfyCJornwMpFEY/1+TTg==
X-Received: by 2002:a05:620a:2408:b0:7b7:106a:19b7 with SMTP id
 af79cd13be357-7be6323b53emr3057191585a.18.1737491510738; 
 Tue, 21 Jan 2025 12:31:50 -0800 (PST)
Received: from bill-the-cat.tail58a08.ts.net ([187.144.16.9])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be61473cf8sm589027385a.15.2025.01.21.12.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 12:31:49 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de
Date: Tue, 21 Jan 2025 14:31:37 -0600
Message-ID: <20250121203147.4133618-1-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: u-boot-qcom@groups.io, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH] Squashed 'dts/upstream/' changes from
	9b6ba2666d63..8531b4b4988c
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

8531b4b4988c Merge tag 'v6.13-rc7-dts-raw'
[snip]
git-subtree-dir: dts/upstream
git-subtree-split: 8531b4b4988c2c9bddc90ea74f2d3e2dca9d5056
---
This will bring us to the v6.13-dts tag of the devicetree-rebasing tree
and so match v6.13 release. Changes and changelog omitted due to size,
and everyone who is listed as a maintainer of a platform with
OF_UPSTREAM enabled has been bcc'd, while other lists were cc'd to avoid
being marked as spam, hopefully.

-- 
Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
