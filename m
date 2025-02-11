Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D16F2A304F2
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2025 08:56:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D8E1C78034;
	Tue, 11 Feb 2025 07:56:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C2E7C6C83D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 07:56:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so35729215e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 23:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739260560; x=1739865360;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f264kMv7Iv6tZjhMlungzZ4frgzsID1q1xcer9o8xqw=;
 b=YMHkqFz3RzHmCziuV7rrEvGprAPchgzlWnpeCLUls1cAhE+QYxBjDWpth1MN6H7lw9
 91uOTPBCAHsQpGC1YlccHUd715zAChIscBXd62iMvM2L7bx4RuoLg+ZFqmFfeUb++bhR
 FVR439usC23wmMX2E7GD/gLniIWLaUWQbU2N2TI2FJbjlXblF8akU9GA3g36zAn1/7MO
 PC9rldqZmuXCf4QJfCpVFChxkX+Ah7iIQ3eTl8WzgyN9qxu0Nq7GGQd4APe8O1bE0ruR
 BJNdsAm1XsMeC+Iz9CRZGRUXju6mq63gWwF5RJDeUoFWukfdALhsokcCcndaAgo8In5a
 LXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739260560; x=1739865360;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f264kMv7Iv6tZjhMlungzZ4frgzsID1q1xcer9o8xqw=;
 b=ZRUx6bEPWV4i7lGBkireN/W5OVSj/amYOlvEsQguzBCMTSrgT3n8/sp1lYzkENerTS
 NOvpRs8XH2Q9mVxTYwcMO8PC9FK4c1MrakMUKRcXIsxb/kgYvY1UOn+aZ8qNaDHOTIAo
 4gUd8MGEQ7cwNASlnZDK52T9/BzZVbhwo2ci6kNL7hP8P67SR8DmvJ3m2vvnKCHS670D
 Ceuf3G/K6E3HDUBIz5Jv8fMZ77S9ulY9AwdrpWbAmdp73quvwEdyuM5rXlFXeBTo1blV
 2oL3OR9x9dW2q6hnixMOrrl9/I6XY/WeKQ9t3LNBmLsaEGn9gCQQ+mZ8HBjWUdeyrSj3
 8rbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoTetepAByuxi/DjMiqMLR0tlTSru7pdnGEMNWZCzq7zEQRjRE49fvSIAkYyN5CacQ2kzg3mIWLuTZXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4k2kLYaGhDmamFjVdPzzClsqa1JbXTIhiqMAaD8fc7z8dvrEE
 fJOVjOD0TRzqYb5sIepT6oAUovnGuAjeZbXOU0S20nNCke0MANRNXnH0PDv+Il4=
X-Gm-Gg: ASbGnctzp4O1YPskMut5Q5lZGyJYhe8QqtF6E+C3Sdv1QetbpAxZukjxGtjFI8ymJY+
 Jz3L7DKcnYrBkHc5AvPdxdNJRQu6Mi+VLhA4wc/gZ0uYWqhwUHLhd7B7SyEi7/7cn71gLYKRrD7
 Liam5WWsA1bVSr9ZCGIji2tdyVt/B7DCp6jxs8CUPmYCljbLt5Ryj/A/r3q7ayTBj+4nERQokyV
 sfldjNPaAxXKhpk2Uh+rZr4iLlFqnirR1ZIJex+2kAb+DdDkoYENpQCfNgjNApWRoozaE33p/Z2
 5dl4zhaGFqtv7qO1rDZ8lsbP
X-Google-Smtp-Source: AGHT+IGf6DWxalsUTCOtgUYGaLAbpxJ5ruYb8tbG6anuOzQfygIB+mLrEoTnfE9p28N5x9gTLAsBqw==
X-Received: by 2002:a05:600c:b8c:b0:431:5863:4240 with SMTP id
 5b1f17b1804b1-439249a3ca8mr130582415e9.24.1739260559712; 
 Mon, 10 Feb 2025 23:55:59 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd150eed5sm9326660f8f.28.2025.02.10.23.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 23:55:59 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Marek Vasut <marex@denx.de>, Patrice CHOTARD
 <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
In-Reply-To: <c8790ad9-0e81-4780-8da8-bbc06377c360@denx.de>
References: <20250130163547.512990-1-patrice.chotard@foss.st.com>
 <4492fe8a-1b60-44da-93b7-383eae3fa269@foss.st.com>
 <c8790ad9-0e81-4780-8da8-bbc06377c360@denx.de>
Date: Tue, 11 Feb 2025 08:55:58 +0100
Message-ID: <87ikpg6hkh.fsf@baylibre.com>
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Mathieu Othacehe <othacehe@gnu.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [Uboot-stm32] [PATCH v5 0/9] Restore USB and add UMS support
	for STiH407-B2260
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

SGkgUGF0cmljZSwgTWFyZWssCgpPbiBsdW4uLCBmw6l2ci4gMTAsIDIwMjUgYXQgMTQ6NDIsIE1h
cmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPiB3cm90ZToKCj4gT24gMi8xMC8yNSAxMToyOCBBTSwg
UGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+PiAKPj4gSGkgTWFyZWsKPgo+IEhpLAo+Cj4+IEFueSBj
aGFuY2UgdG8gZ2V0IHRoaXMgc2VyaWVzIG1lcmdlZCBpbiBuZXh0IFUtQm9vdCB0YWcgMjAyNS4w
NC1yYzIgPwo+IEdhZGdldCBzdHVmZiBpcyBvbiBNYXR0aWpzIGRlc2ssIHBsZWFzZSBwaW5nIG1l
IGluIGEgZmV3IGRheXMgaWYgaGUgCj4gZG9lc24ndCBwaWNrIGl0IHVwLCBJJ2xsIGRvIHNvIHRo
ZW4uIFNvcnJ5IGZvciB0aGUgZGVsYXkuCgpTb3JyeSBhYm91dCB0aGUgZGVsYXksIEkgbWlzc2Vk
IHRoaXMgc2VyaWVzIGJlY2F1c2UgaXQgd2FzIG5vdCBhc3NpZ25lZAp0byBtZSBvbiBwYXRjaHdv
cmsuCgpJIHdpbGwgcGljayBpdCB1cCBzaG9ydGx5LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
