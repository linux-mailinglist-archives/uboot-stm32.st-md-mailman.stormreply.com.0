Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F1682F267
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jan 2024 17:30:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21F82C6B476;
	Tue, 16 Jan 2024 16:30:10 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5DC9C6B457
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 16:30:08 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a27733ae1dfso1159795166b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 08:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705422608; x=1706027408;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ah+KpIFxINeqjKoWk0Est9A8em2cueX7ZTdn5KWqH3g=;
 b=D9E9zak3ukuqdY75WTszU6g0+tmVxdnxnjhKzMVi30c/IjvCzYPLzrAyzUd4+8H9PH
 KvTyKZth6lW7IMzi+U62tLc346ye8RH5qNB8n3m8qX4chuoeaEcghBINIdLCK6oFVJmI
 Ask7GVJSNzrCGbhrQL12ZzeLaeARQNcHKTLg5kpNFnqStYpkmSQBKEQy4J5tj6a8ez1y
 sfKMG0W4bwhyiuXEs8IKaNCeeWaPUxLTC45k1AdwvOybjPopH4ITjz/g1aDLllFci445
 ErHsubEZU5fxcIomyPpp5uTnkXg6eVUQir6+zDUv9CxrIwWUXE84nf9z8TOIb0yv5i/5
 pUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705422608; x=1706027408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ah+KpIFxINeqjKoWk0Est9A8em2cueX7ZTdn5KWqH3g=;
 b=eTOJ5CVvTkmYPIcN39g9cZPQy1lDxIk1rWzXjCugIje4n//GH/pEKUxwd9t4KbGXOq
 nCuRBYQJf/PFYVhGfXSBtn+KalBWeRd8gIgiXTvTW0uvQ1BZ+ZZdT9NJTVgGqa095Mzh
 QDlgivL9FS7ZeOHdpgaCS/Sln5NuN8o7emeTqQOD8BIpwAW0npTqy+QhobUlWMGJAIfH
 2+6UQ+V6WJIkyBxFiY0W8okuQjfK0cbNvXnUC0uhwg3qqZEOdKmbvwF5gD3MnSIXS0ht
 O6OSBwHTcHTOxs9d7/x/x9WN3BErIwGMh1ZLaAobr+XjbP5aiaDsSpm461NPLIRdOIa9
 aAHw==
X-Gm-Message-State: AOJu0YxHAjA6J++oVMfvefD/7y4bMc3IFMzhOsnVmeTuVGbyc+lmu1D1
 p3Yi8VVVaHzgJ7wLp7y44PN7QM4WHS/n/SYphsA=
X-Google-Smtp-Source: AGHT+IFGfYdIvMft5RT7ZH1jll3NhxB2kiGblL97kbok8B/4PzLB/H4e9p6JtgvH0RmI1Cw+TdiPZ3L0Yj587MNLJmw=
X-Received: by 2002:a17:907:b023:b0:a2b:684:11d with SMTP id
 fu35-20020a170907b02300b00a2b0684011dmr1518646ejc.255.1705422608048; Tue, 16
 Jan 2024 08:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20240116161231.741794-1-patrice.chotard@foss.st.com>
In-Reply-To: <20240116161231.741794-1-patrice.chotard@foss.st.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 17 Jan 2024 00:29:57 +0800
Message-ID: <CAEUhbmUOy-iJ9SEiA8atU=V5CG+DAAxtQ9HJXO2A5_W=hwe1jw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Bin Meng <bmeng@tinylab.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ion Agorria <ion@agorria.com>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] common: console: Fix print complete stdio
	device list
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

T24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgMTI6MTPigK9BTSBQYXRyaWNlIENob3RhcmQKPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPiBJbiBjYXNlIENPTlNPTEVfTVVYIGFu
ZCBTWVNfQ09OU09MRV9JU19JTl9FTlYgYXJlIG9uIGFuZAo+IHN0ZGluIG9yIHN0ZG91dCBvciBz
dGRlcnIgYXJlIG1pc3NpbmcgaW4gZW52aXJvbm1lbnQsIGFzIGZhbGxiYWNrLCBnZXQKPiB0aGVz
ZSBlaXRoZXIgZnJvbSBzdGRpb19kZXZpY2VzW3N0ZF0gb3Igc3RkaW9fZGV2aWNlc1tzdGRdLT5u
YW1lLgo+Cj4gRml4ZXM6IDZiMzQzYWIzOGQgKCJjb25zb2xlOiBQcmludCBvdXQgY29tcGxldGUg
c3RkaW8gZGV2aWNlIGxpc3QiKQo+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxw
YXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gLS0tCj4KPiAgY29tbW9uL2NvbnNvbGUuYyB8
IDIzICsrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9jb21tb24vY29uc29sZS5j
IGIvY29tbW9uL2NvbnNvbGUuYwo+IGluZGV4IGNhZDY1ODkxZmM5Li44YmZjZmNlNTY0MyAxMDA2
NDQKPiAtLS0gYS9jb21tb24vY29uc29sZS5jCj4gKysrIGIvY29tbW9uL2NvbnNvbGUuYwo+IEBA
IC0xMDQ5LDYgKzEwNDksMTEgQEAgaW50IGNvbnNvbGVfY2xlYXIodm9pZCkKPiAgICAgICAgIHJl
dHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGNoYXIgKmdldF9zdGRpbyhjb25zdCB1OCBzdGQpCj4g
K3sKPiArICAgICAgIHJldHVybiBzdGRpb19kZXZpY2VzW3N0ZF0gPyBzdGRpb19kZXZpY2VzW3N0
ZF0tPm5hbWUgOiAiTm8gZGV2aWNlcyBhdmFpbGFibGUhIjsKPiArfQo+ICsKPiAgc3RhdGljIHZv
aWQgc3RkaW9fcHJpbnRfY3VycmVudF9kZXZpY2VzKHZvaWQpCj4gIHsKPiAgICAgICAgIGNoYXIg
KnN0ZGlubmFtZSwgKnN0ZG91dG5hbWUsICpzdGRlcnJuYW1lOwo+IEBAIC0xMDYwLDE5ICsxMDY1
LDEzIEBAIHN0YXRpYyB2b2lkIHN0ZGlvX3ByaW50X2N1cnJlbnRfZGV2aWNlcyh2b2lkKQo+ICAg
ICAgICAgICAgICAgICBzdGRvdXRuYW1lID0gZW52X2dldCgic3Rkb3V0Iik7Cj4gICAgICAgICAg
ICAgICAgIHN0ZGVycm5hbWUgPSBlbnZfZ2V0KCJzdGRlcnIiKTsKPgo+IC0gICAgICAgICAgICAg
ICBzdGRpbm5hbWUgPSBzdGRpbm5hbWUgPyA6ICJObyBpbnB1dCBkZXZpY2VzIGF2YWlsYWJsZSEi
Owo+IC0gICAgICAgICAgICAgICBzdGRvdXRuYW1lID0gc3Rkb3V0bmFtZSA/IDogIk5vIG91dHB1
dCBkZXZpY2VzIGF2YWlsYWJsZSEiOwo+IC0gICAgICAgICAgICAgICBzdGRlcnJuYW1lID0gc3Rk
ZXJybmFtZSA/IDogIk5vIGVycm9yIGRldmljZXMgYXZhaWxhYmxlISI7Cj4gKyAgICAgICAgICAg
ICAgIHN0ZGlubmFtZSA9IHN0ZGlubmFtZSA/IDogZ2V0X3N0ZGlvKHN0ZGluKTsKPiArICAgICAg
ICAgICAgICAgc3Rkb3V0bmFtZSA9IHN0ZG91dG5hbWUgPyA6IGdldF9zdGRpbyhzdGRvdXQpOwo+
ICsgICAgICAgICAgICAgICBzdGRlcnJuYW1lID0gc3RkZXJybmFtZSA/IDogZ2V0X3N0ZGlvKHN0
ZGVycik7Cj4gICAgICAgICB9IGVsc2Ugewo+IC0gICAgICAgICAgICAgICBzdGRpbm5hbWUgPSBz
dGRpb19kZXZpY2VzW3N0ZGluXSA/Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgc3RkaW9fZGV2
aWNlc1tzdGRpbl0tPm5hbWUgOgo+IC0gICAgICAgICAgICAgICAgICAgICAgICJObyBpbnB1dCBk
ZXZpY2VzIGF2YWlsYWJsZSEiOwo+IC0gICAgICAgICAgICAgICBzdGRvdXRuYW1lID0gc3RkaW9f
ZGV2aWNlc1tzdGRvdXRdID8KPiAtICAgICAgICAgICAgICAgICAgICAgICBzdGRpb19kZXZpY2Vz
W3N0ZG91dF0tPm5hbWUgOgo+IC0gICAgICAgICAgICAgICAgICAgICAgICJObyBvdXRwdXQgZGV2
aWNlcyBhdmFpbGFibGUhIjsKPiAtICAgICAgICAgICAgICAgc3RkZXJybmFtZSA9IHN0ZGlvX2Rl
dmljZXNbc3RkZXJyXSA/Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgc3RkaW9fZGV2aWNlc1tz
dGRlcnJdLT5uYW1lIDoKPiAtICAgICAgICAgICAgICAgICAgICAgICAiTm8gZXJyb3IgZGV2aWNl
cyBhdmFpbGFibGUhIjsKPiArICAgICAgICAgICAgICAgc3RkaW5uYW1lID0gZ2V0X3N0ZGlvKHN0
ZGluKTsKPiArICAgICAgICAgICAgICAgc3Rkb3V0bmFtZSA9IGdldF9zdGRpbyhzdGRvdXQpOwo+
ICsgICAgICAgICAgICAgICBzdGRlcnJuYW1lID0gZ2V0X3N0ZGlvKHN0ZGVycik7Cj4gICAgICAg
ICB9Cj4KPiAgICAgICAgIC8qIFByaW50IGluZm9ybWF0aW9uICovCj4gLS0KClRoaXMgY2FuIGJl
IGZ1cnRoZXIgc2ltcGxpZmllZCB0bzoKCmNoYXIgKnN0ZGlubmFtZSA9IE5VTEw7CmNoYXIgKnN0
ZG91dG5hbWUgPSBOVUxMOwpjaGFyICpzdGRlcnJuYW1lIE5VTEw7CgogICAgaWYgKENPTkZJR19J
U19FTkFCTEVEKENPTlNPTEVfTVVYKSAmJgogICAgICAgICBDT05GSUdfSVNfRU5BQkxFRChTWVNf
Q09OU09MRV9JU19JTl9FTlYpKSB7CiAgICAgICAgICAgICAgIC8qIHN0ZGluIHN0ZG91dCBhbmQg
c3RkZXJyIGFyZSBpbiBlbnZpcm9ubWVudCAqLwogICAgICAgICAgICAgICBzdGRpbm5hbWUgID0g
ZW52X2dldCgic3RkaW4iKTsKICAgICAgICAgICAgICAgc3Rkb3V0bmFtZSA9IGVudl9nZXQoInN0
ZG91dCIpOwogICAgICAgICAgICAgICBzdGRlcnJuYW1lID0gZW52X2dldCgic3RkZXJyIik7CiAg
ICB9CgogICBzdGRpbm5hbWUgPSBzdGRpbm5hbWUgPyA6IGdldF9zdGRpbyhzdGRpbik7CiAgIHN0
ZG91dG5hbWUgPSBzdGRvdXRuYW1lID8gOiBnZXRfc3RkaW8oc3Rkb3V0KTsKICAgc3RkZXJybmFt
ZSA9IHN0ZGVycm5hbWUgPyA6IGdldF9zdGRpbyhzdGRlcnIpOwoKUmVnYXJkcywKQmluCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
