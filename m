Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61A790DF9
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:49:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DB3FC6B458;
	Sun,  3 Sep 2023 20:49:04 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97F7FC6B457
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:49:02 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-9a5be3166a2so111196866b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774142; x=1694378942;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jcWhLjODsHJathNyERlIz1JMPXa8o1RlwkEl/JZ4e1M=;
 b=VYlDDhLjuTnQs3j8xDmfB2eCrnG2iz+omtE9LJtuj31gLru93NSfchbnzSXuM9TzWA
 0ANFFFh6p9jJRRBW9UhwnHINcIwW+QhS3Pp5VHZ7jus/F7yp7U0clObutvxi+AfCToOE
 Wyr/py0V8agaXl+pYDc/tUfU5SEe3Py6dUx6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774142; x=1694378942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jcWhLjODsHJathNyERlIz1JMPXa8o1RlwkEl/JZ4e1M=;
 b=RS+BY74LTgovgtIANKK66wtF3vkAoe5vW+NxwWG5BpiTjU3c1z0qkJKGdhvv8krghf
 bzlJpjcUpds+WPabZBEMzoqiDlO0+cc4ZGTqPmz8T4yBZVJi7LhvepA1SGYEVsRP9Y5L
 iWOmGiCZWDhsZzN65xXrIlxrVUrzjHQ+4CEHYbuBa0FUt1IGSV5iPsGVNvHXAxNgVhl/
 LfLINOUlmKWiTHha6BI0OMTFHaSfomI3zV8TTCbDvHj1RK9inHyHfy2ChrwlD3mOLw4E
 0ScrnpBfK7pELnL+XYcLGS2lkMNJ71oLoaN8HSVY9b1zKbfCZ9UT65Iv/lw7lNwR7met
 xGdw==
X-Gm-Message-State: AOJu0YxPL7S2hdvKAw8b+hqUtKmH6ZpJWlSfmonvmvUAR7i2jSUR9gbN
 NSHAv6V56AdCaWEqra8w/tWuaA==
X-Google-Smtp-Source: AGHT+IEnK+Yp8V1fwSktz0bdHFmRcG4nDU6DvONKhLOMnyPzYAlg+DAJSFNgNin1zQJ++hyEQn0o4g==
X-Received: by 2002:a17:906:3116:b0:9a1:8a54:145f with SMTP id
 22-20020a170906311600b009a18a54145fmr5517579ejx.40.1693774142293; 
 Sun, 03 Sep 2023 13:49:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm5182466ejb.199.2023.09.03.13.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:49:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:48:47 +0200
Message-Id: <20230903204849.660722-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 08/10] ARM: dts: stm32: add pin map for LTDC
	on stm32f7
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Y29tbWl0IGJhMjg3ZDFhMDEzNzcwMmEyMjRiMWY0ODY3M2Q1MjkyNTdiM2M0YmYgTGludXggdXBz
dHJlYW0uCgpBZGQgcGluIGNvbmZpZ3VyYXRpb25zIGZvciB1c2luZyBMVERDIChMQ0QtdGZ0IERp
c3BsYXkgQ29udHJvbGxlcikgb24Kc3RtMzJmNzQ2LWRpc2NvIGJvYXJkLgoKU2lnbmVkLW9mZi1i
eTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgpS
ZXZpZXdlZC1ieTogUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9z
cy5zdC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3Jn
dWVAZm9zcy5zdC5jb20+Ci0tLQoKIGFyY2gvYXJtL2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRzaSB8
IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMyZjctcGluY3RybC5k
dHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMyZjctcGluY3RybC5kdHNpCmluZGV4IDYwN2ZlNDJmNGY0
Ni4uZDM3MDZlZTMzYjVmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9kdHMvc3RtMzJmNy1waW5jdHJs
LmR0c2kKKysrIGIvYXJjaC9hcm0vZHRzL3N0bTMyZjctcGluY3RybC5kdHNpCkBAIC0zNzYsNiAr
Mzc2LDQwIEBACiAJCQkJCWJpYXMtcHVsbC11cDsKIAkJCQl9OwogCQkJfTsKKworCQkJbHRkY19w
aW5zX2E6IGx0ZGMtMCB7CisJCQkJcGlucyB7CisJCQkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgo
J0UnLCA0LCBBRjE0KT4sIC8qIExDRF9CMCAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0cnLDEy
LCBBRjkpPiwgIC8qIExDRF9CNCAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0knLCA5LCBBRjE0
KT4sIC8qIExDRF9WU1lOQyAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0knLDEwLCBBRjE0KT4s
IC8qIExDRF9IU1lOQyAqLworCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0knLDE0LCBBRjE0KT4sIC8q
IExDRF9DTEsgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdJJywxNSwgQUYxNCk+LCAvKiBMQ0Rf
UjAgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgMCwgQUYxNCk+LCAvKiBMQ0RfUjEgKi8K
KwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgMSwgQUYxNCk+LCAvKiBMQ0RfUjIgKi8KKwkJCQkJ
CSA8U1RNMzJfUElOTVVYKCdKJywgMiwgQUYxNCk+LCAvKiBMQ0RfUjMgKi8KKwkJCQkJCSA8U1RN
MzJfUElOTVVYKCdKJywgMywgQUYxNCk+LCAvKiBMQ0RfUjQgKi8KKwkJCQkJCSA8U1RNMzJfUElO
TVVYKCdKJywgNCwgQUYxNCk+LCAvKiBMQ0RfUjUgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdK
JywgNSwgQUYxNCk+LCAvKiBMQ0RfUjYgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgNiwg
QUYxNCk+LCAvKiBMQ0RfUjcgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgNywgQUYxNCk+
LCAvKiBMQ0RfRzAgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgOCwgQUYxNCk+LCAvKiBM
Q0RfRzEgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgOSwgQUYxNCk+LCAvKiBMQ0RfRzIg
Ki8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywxMCwgQUYxNCk+LCAvKiBMQ0RfRzMgKi8KKwkJ
CQkJCSA8U1RNMzJfUElOTVVYKCdKJywxMSwgQUYxNCk+LCAvKiBMQ0RfRzQgKi8KKwkJCQkJCSA8
U1RNMzJfUElOTVVYKCdKJywxMywgQUYxNCk+LCAvKiBMQ0RfQjEgKi8KKwkJCQkJCSA8U1RNMzJf
UElOTVVYKCdKJywxNCwgQUYxNCk+LCAvKiBMQ0RfQjIgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVY
KCdKJywxNSwgQUYxNCk+LCAvKiBMQ0RfQjMgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywg
MCwgQUYxNCk+LCAvKiBMQ0RfRzUgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywgMSwgQUYx
NCk+LCAvKiBMQ0RfRzYgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywgMiwgQUYxNCk+LCAv
KiBMQ0RfRzcgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywgNCwgQUYxNCk+LCAvKiBMQ0Rf
QjUgKi8KKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywgNSwgQUYxNCk+LCAvKiBMQ0RfQjYgKi8K
KwkJCQkJCSA8U1RNMzJfUElOTVVYKCdLJywgNiwgQUYxNCk+LCAvKiBMQ0RfQjcgKi8KKwkJCQkJ
CSA8U1RNMzJfUElOTVVYKCdLJywgNywgQUYxNCk+OyAvKiBMQ0RfREUgKi8KKwkJCQkJc2xldy1y
YXRlID0gPDI+OworCQkJCX07CisJCQl9OwogCQl9OwogCX07CiB9OwotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
