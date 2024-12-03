Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C5B9E1827
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 10:47:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D1F5C6C83D;
	Tue,  3 Dec 2024 09:47:47 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D73DAC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 09:47:39 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53dde5262fdso6103916e87.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Dec 2024 01:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733219259; x=1733824059;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SMntASOa/HY1z46JFHxK1WzDul73tI6Z4ti7XDkdFWg=;
 b=m6e4zIpqjbzK58X0CNj7V4PkfFeVEqoL1coHQVvsodBuLGhNkXKzwA3BGGVa6I4dcB
 xmy7mqP188p71aHAwL2C+xA9OsyTq76nxbHJRmr+lQrX5qPvgYL1D+VYDq5IfRpntUzG
 7ohlS1ZDvGT9sp5rsHco9QURd/cBTYP+EJs1RF+GtcljT8m4MBZUyjFZ4NaI6X/XqvnC
 9VWDRYaY9GZnwNBiydATQvJ8K3MdCXyq230kbGW0tthWJ0wsDOzSGIsy9iHNajeRfMkO
 jpdXOiWfTnVqgq68NYAi0RsjAtwnBuspR1+q19kB+x/4P0qkdh8VfTWo3/9E0v9wL0iT
 R7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733219259; x=1733824059;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SMntASOa/HY1z46JFHxK1WzDul73tI6Z4ti7XDkdFWg=;
 b=TDAxJlcd9SLz7Yn/lvBrJ0R3ZqWVzIBqWUDzvxNCV0j+bewoPvT0VykotqzXEwnUPa
 4S7anXFV11XW/Y2vvxCOV5rvek0EBCnRlxO3fcdR+3sb2J0RZMXQcMzmWf6y2xxhA+4T
 3iX2ntT7XQInDqxCEeDJ+HtD2NZfuNXNCeFTtXCrc66BN7sIeLuBl5XiiiEFt4MFQR/t
 3RYiaET44aaqPrHOHW/BCi7atnDazGMMo1wjVsUjUbYign6oQcSpK9R0kKEMjcUtYxwV
 d7W3KKTbkZ1z6CBAAqfsb1YT2XFnUKSxmuc0IQjg0k5//qKZJYeK90hfw7XBMYISjY2U
 otDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJjO3Gw8BepaQJflweQI/1yN0ACpRrla6TABqbBFw34GuvWAsMdfj1u9S9aeD9kG0N/x31xfZ94/zHPQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyIvQ8QaBKc1vgFn8EBZsE3gth03irg5Jbu00RLcYC0E7lLYcTx
 qf+HvI3jMg5abxUwFA1i80H17s73hcDfd2ka5PE05SG8tHG+xZDelB8zYRSujn0=
X-Gm-Gg: ASbGnctKeGZRk0A0jjWWWjPp2E9IOgzy4DfJWYpcUMPq4iLdwrA8t+o+9FmMGmkNO00
 I9s/hcH4DHMvGg5jjcapxos7DX9h9guczNHbdiC62FI9+YQF5GpT9rp2QL70YDKdTUtJS4pCjqf
 mb0bStXhXJf0lLiJdg5KQeMGnqHPc8hzMFQ2yryGng3oB0BNNNHqNOJBhxoQwDYJcWO7tIXettH
 CDrf1EocjCKd+iV2NwLbpARWEUBr6oufeuzx4T2+BiCZoT9g2IWcQ==
X-Google-Smtp-Source: AGHT+IEcPKJ1DGgnEWT0GXgmat/04FjIObeghUxuRhY3szj1+ljWI7zrMsZpuKAwoNsfaEm/63a69g==
X-Received: by 2002:a05:6512:1304:b0:53e:1959:322e with SMTP id
 2adb3069b0e04-53e19593377mr225558e87.34.1733219259078; 
 Tue, 03 Dec 2024 01:47:39 -0800 (PST)
Received: from localhost ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0dc6831sm181632855e9.20.2024.12.03.01.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 01:47:38 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
In-Reply-To: <20241202074644.5380-1-patrice.chotard@foss.st.com>
References: <20241202074644.5380-1-patrice.chotard@foss.st.com>
Date: Tue, 03 Dec 2024 10:47:35 +0100
Message-ID: <87zfldnlmw.fsf@baylibre.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Lukasz Majewski <lukma@denx.de>,
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

SGkgUGF0cmljZSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gbHVuLiwgZMOpYy4gMDIs
IDIwMjQgYXQgMDg6NDYsIFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3Qu
Y29tPiB3cm90ZToKCj4gSW4gY2FzZSAidW1zIiBjb21tYW5kIGlzIHVzZWQgb24gcGxhdGZvcm1z
IHdoaWNoIGRvbid0IGltcGxlbWVudAo+IGdfZG5sX2JvYXJkX3VzYl9jYWJsZV9jb25uZWN0ZWQo
KSBhbmQgVVNCIGNhYmxlIGlzIG5vdCBjb25uZWN0ZWQsCj4gd2Ugc3RheSBpbnNpZGUgc2xlZXBf
dGhyZWFkKCkgZm9yZXZlciBhbmQgd2F0Y2hkb2cgaXMgdHJpZ2dlcmVkLgo+Cj4gQWRkIHNjaGVk
dWxlKCkgY2FsbCB0byBhdm9pZCB0aGlzIGlzc3VlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmlj
ZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+CgpSZXZpZXdlZC1ieTogTWF0
dGlqcyBLb3JwZXJzaG9layA8bWtvcnBlcnNob2VrQGJheWxpYnJlLmNvbT4KCj4KPiAtLS0KPgo+
IENoYW5nZXMgaW4gdjI6Cj4gICAtIG1vdmUgc2NoZWR1bGUoKSByaWdodCBiZWZvcmUgZG1fdXNi
X2dhZGdldF9oYW5kbGVfaW50ZXJydXB0cygpCj4KPiAgZHJpdmVycy91c2IvZ2FkZ2V0L2ZfbWFz
c19zdG9yYWdlLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2ZfbWFzc19zdG9yYWdlLmMgYi9kcml2ZXJz
L3VzYi9nYWRnZXQvZl9tYXNzX3N0b3JhZ2UuYwo+IGluZGV4IGZmZTFhZTZlYjczLi5kM2ZjNGFj
YjQwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvZl9tYXNzX3N0b3JhZ2UuYwo+
ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9mX21hc3Nfc3RvcmFnZS5jCj4gQEAgLTY4Miw2ICs2
ODIsNyBAQCBzdGF0aWMgaW50IHNsZWVwX3RocmVhZChzdHJ1Y3QgZnNnX2NvbW1vbiAqY29tbW9u
KQo+ICAJCQlrID0gMDsKPiAgCQl9Cj4gIAo+ICsJCXNjaGVkdWxlKCk7Cj4gIAkJZG1fdXNiX2dh
ZGdldF9oYW5kbGVfaW50ZXJydXB0cyh1ZGNkZXYpOwo+ICAJfQo+ICAJY29tbW9uLT50aHJlYWRf
d2FrZXVwX25lZWRlZCA9IDA7Cj4gLS0gCj4gMi4yNS4xCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
