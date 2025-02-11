Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7987A304EB
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2025 08:54:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69544C78034;
	Tue, 11 Feb 2025 07:54:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B10FC6C83D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 07:54:12 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so14024805e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 23:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739260452; x=1739865252;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CDM1tbtYSvhWJw/5Ienrha+b7FbtYp5kdybQ/GdDzj4=;
 b=E24n9rJ/kk1uuB/2y2vRAAx43Qj68wFXTaYmaPIHrXNTqfhK0OEhMf4FUudCxXOLlS
 Vjt5BLhGO3l10DF/kRhsXUtL2T5nh4YuKJcL5jJ8RMrKkFKPO6nmlxfUZiEElErNRxeE
 RUUNZmcv6Yc5oLGy002HNDNqNyp+rsxkQ+3jYaoUh/G0EwQaapfaxnEGdrgtRlWnHhck
 UbCYAGW24DpHQlpnMHY2J4e44ihJlvPZSWq8GIWw7jOqHLbW3PqWInymNel+Tt/XpUEE
 2O5dcO4aTqwu9uA9kMJj6gRIhTXZNGc4OTkxzxsXOHYsqBLL7MX31ictmdBP3pQMHd6x
 CFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739260452; x=1739865252;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDM1tbtYSvhWJw/5Ienrha+b7FbtYp5kdybQ/GdDzj4=;
 b=WP2NjAtBMM2PeS0w0ZWYj9N7JayqcyrjZjLeSMTTbaw01b7bIWzMoAV08sqJzciqTC
 ytr52ljCnRgaC/OVoRcvveLbyrVpeG3DQjo6C3/xpxJI//2g2whLXUhPJoWlK2tMIWve
 uOGVyulIrWvXsFLChy+Dz8GTE29MG2MHxb2j6r3NTdUxXfTHbnxsUgBs05bIzKjJ5Vhc
 m1z5Eqax8MkL4m+mDSyi3jgUbeG3xw6PgB9TpsUKWm65pSB6IveHnKP2WZDrjKiBWniZ
 hsVkgBOa2YGNkhnDNzLWsbIxZ71OMHFBpBIQn+vUYBnH0spLg8zZ8IIxIftX5XIZmvUR
 5KyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyW3S/YAsiH2hYsw2wkkKb594TzuxMbvywYNR2G4LZZeuDuycdM49rnQyqwTG49iBqm8xodrd2qzN2fA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxCPRZ5UhG8qt1+w38oM3Oyf5RE9Gk7rKp7Yun2aQt0zT+AyPU9
 aS6dqKG5Rr5thp8yiCIo8x/15RxIshtX3uNKGRVJH7GLFypS9OUjuMtFl+YAmn4=
X-Gm-Gg: ASbGncsFes40ugtm4l3o1RS6zZcq4imLukqZnaV0Py5/74KsJDFGjMVY6z6itKdpZzK
 +dxOjM/Cyt6saMM6up3kgSKPQnYPQNFhJHptIHS04HNPjia3qn2gbcLk22v3b9vbjwzBg8hiP+w
 n4i/SQ5fdEKIic8Xni8qK8PZBXEatYgyzyp1sWdbh3XpanwUWqK+66kEz32AcnihNCeAQY8i3kz
 ufq8Jz1HI9c/8UesvBY3Wwm7DLrwlYoJtZxKuvHj7ju2FjPiyvkleqWJ/JaVZv2SyCafrySXK8q
 VIqSwaO1DRviqMTl2894uUSU
X-Google-Smtp-Source: AGHT+IHZ1rj3Yu/j9Zl6NAfBazJhcxRMAgIa2qMsUfFucICk7f3ARXiQqqHc22Nawq6/YCjwWAodRw==
X-Received: by 2002:a05:600c:4e8b:b0:436:1b08:4c78 with SMTP id
 5b1f17b1804b1-4394c8693d0mr26991955e9.31.1739260451566; 
 Mon, 10 Feb 2025 23:54:11 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dfc8897sm165711145e9.31.2025.02.10.23.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 23:54:11 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Marek Vasut <marex@denx.de>, Patrice CHOTARD
 <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
In-Reply-To: <f1d2068c-b393-4b90-b923-aa51b0972dc3@denx.de>
References: <20241202074644.5380-1-patrice.chotard@foss.st.com>
 <87zfldnlmw.fsf@baylibre.com>
 <c89e94bf-0ed6-4b3f-9f3b-eee9d30a91df@foss.st.com>
 <f1d2068c-b393-4b90-b923-aa51b0972dc3@denx.de>
Date: Tue, 11 Feb 2025 08:54:10 +0100
Message-ID: <87lduc6hnh.fsf@baylibre.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: gadget: f_mass_storage: Add
 schedule() in sleep_thread()
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

T24gbHVuLiwgZsOpdnIuIDEwLCAyMDI1IGF0IDE0OjQyLCBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4gd3JvdGU6Cgo+IE9uIDIvMTAvMjUgMTE6MjggQU0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90
ZToKPj4gSGkgTWFyZWsKPgo+IEhpLAo+Cj4+IEFueSBjaGFuY2UgdG8gZ2V0IHRoaXMgcGF0Y2gg
bWVyZ2VkIGluIG5leHQgVS1Cb290IHRhZyAyMDI1LjA0LXJjMiA/Cj4gR2FkZ2V0IHN0dWZmIGlz
IG9uIE1hdHRpanMgZGVzaywgcGxlYXNlIHBpbmcgbWUgaW4gYSBmZXcgZGF5cyBpZiBoZSAKPiBk
b2Vzbid0IHBpY2sgaXQgdXAsIEknbGwgZG8gc28gdGhlbi4gU29ycnkgZm9yIHRoZSBkZWxheS4K
ClNvbWVob3csIHRoaXMgd2FzIG5vdCBhc3NpZ25lZCB0byBtZSBvbiBwYXRjaHdvcmssIHNvIEkg
bWlzc2VkIHRoaXMuClNvcnJ5IGFib3V0IHRoZSBkZWxheSwgd2lsbCBwaWNrIHVwIHRvZGF5Lgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=
