Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D8380EE73
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Dec 2023 15:12:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B615C6C856;
	Tue, 12 Dec 2023 14:12:01 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA020C6B47F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 14:11:59 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-77f552d4179so242578185a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 06:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702390319; x=1702995119;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4j0nCBkGGJQwj35jWIGakQMHyUzXzmTlOIHOC/CgU08=;
 b=ECD0nnxlEX0oVAsSdocsjoGMzqiUHje9isGb6ebK4ECg6qL1DwW3GaShppgdr/vsaW
 knf0RimeyEndjkFYHeELHna7IwHoi55nMbvSNpNf9O+GNtMSQTnfMFBKnTtph8fZVRLs
 if+fErrXnrGNep+ZuCY+eZzRArWa8nusYUgxU5Gq480hsbg3X1RTkcbNXZn9V6HeTo2T
 8mIrvhBeyiS2wc4GeuHTRLpVRYDOYWtHJBSB+4TkC9bzuItJ0FGMvD798V6rR4EQngfg
 ih4QahTy+pTv35KMyBv2jsXpT94fdwIcEOgl8rIbuE3e99JHJJwfuyLC3s8l3ZFulNch
 cobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702390319; x=1702995119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4j0nCBkGGJQwj35jWIGakQMHyUzXzmTlOIHOC/CgU08=;
 b=vRufEgPvRiQRI3BPxaLEqxZM7qzErdFIqUL6KIR0A6OEz18MHi59XCSw0qHLi1lnsr
 67INn5siujtAEXrtrmOaAzTh3xax816vKZmr17QIKS2NuhAbP30axD68gSL8x0Z1CT8X
 bvLgCKABjZPhCjq64InXKTDCQSTgsEab5/yYStEm80Ge4vNrlm2b6MWOrOC07rPe71bI
 lZ3F9n87xl20msEOerv5W7+OcG/jDXei26Ofw+UZzJLpFb+SoQRNFGGZ4ZX9TlhYrBM6
 cj7DrpQWjj1oKPbYyTztkG200Ky79h4vrvrHbOnKQ7IpKLU6gOO+gfTnZ1Y5hOZ2cnh1
 Q+1A==
X-Gm-Message-State: AOJu0YwIH9a0+PI7244IxYDzn89M32bNFjLc8uBWxDAt9rn7bf/WJuq1
 upOUtlyrn3sdfufIEs2GA3A=
X-Google-Smtp-Source: AGHT+IHrvGfKuhcNbnpEDNsa84QYxiXGbwiVGYrR+zxObhr3UMxVE8PMAbDlnmbghhdrnCqTSEOKGA==
X-Received: by 2002:a05:620a:42:b0:77e:fba3:936e with SMTP id
 t2-20020a05620a004200b0077efba3936emr6219816qkt.80.1702390318677; 
 Tue, 12 Dec 2023 06:11:58 -0800 (PST)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 po6-20020a05620a384600b0077d9fdde1dcsm3737299qkn.42.2023.12.12.06.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 06:11:58 -0800 (PST)
Message-ID: <9760cfbe-ad54-8a38-a9a7-9308b0b7ca25@gmail.com>
Date: Tue, 12 Dec 2023 09:11:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: neil.armstrong@linaro.org, Igor Prusov <ivprusov@sberdevices.ru>,
 u-boot@lists.denx.de, Michal Simek <michal.simek@amd.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20231109105516.24892-1-ivprusov@sberdevices.ru>
 <88960dfc-441f-49fb-bd36-ee32e754b003@linaro.org>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <88960dfc-441f-49fb-bd36-ee32e754b003@linaro.org>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 uboot-stm32@st-md-mailman.stormreply.com, Joel Stanley <joel@jms.id.au>,
 kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v7 0/8] clk: Switch from soc_clk_dump to
	clk_ops function
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTIvMTIvMjMgMDk6MDMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOg0KPiBIaSBJZ29yLCBTZWFu
LA0KPiANCj4gT24gMDkvMTEvMjAyMyAxMTo1NSwgSWdvciBQcnVzb3Ygd3JvdGU6DQo+PiBDdXJy
ZW50bHkgY2xvY2sgcHJvdmlkZXJzIG1heSBvdmVycmlkZSBkZWZhdWx0IGltcGxlbWVudGF0aW9u
IG9mDQo+PiBzb2NfY2xrX2R1bXAgZnVuY3Rpb24gdG8gcmVwbGFjZSBjbGsgZHVtcCBjb21tYW5k
IG91dHB1dC4gVGhpcyBjYXVzZXMNCj4+IGNvbmZ1c2luZyBiZWhhdmlvdXIgd2hlbiB1LWJvb3Qg
aXMgYnVpbHQgd2l0aCBvbmUgb2Ygc3VjaCBkcml2ZXJzDQo+PiBlbmFibGVkIGJ1dCBzdGlsbCBo
YXMgY2xvY2tzIGRlZmluZWQgdXNpbmcgQ0NGLiBGb3IgZXhhbXBsZSwgZW5hYmxpbmcNCj4+IENN
RF9DTEsgYW5kIHVzaW5nIGNsayBkdW1wIG9uIHNhbmRib3ggdGFyZ2V0IHdpbGwgbm90IHNob3cg
Q0NGIGNsb2Nrcw0KPj4gYmVjYXVzZSBrMjEwIGRyaXZlciBvdmVycmlkZXMgY29tbW9uIHNvY19j
bGtfZHVtcC4NCj4gDQo+IFdoYXQncyB0aGUgc3RhdGUgb2YgdGhpcyBzZXJpZSA/DQoNCkF3YWl0
aW5nIHVwc3RyZWFtLiBJIHdpbGwgbWFrZSBhIFBSIHdpdGggaXQgZm9yIG5leHQuDQoNCi0tU2Vh
bg0KDQo+IFRoYW5rcywNCj4gTmVpbA0KPiANCj4+DQo+PiBDaGFuZ2Vsb2c6DQo+PiDCoCB2MSAt
PiB2MjoNCj4+IMKgIC0gQWRkIG1pc3Npbmcgc3RhdGljIHRvIGR1bXAgZnVuY3Rpb25zDQo+Pg0K
Pj4gwqAgdjIgLT4gdjM6DQo+PiDCoCAtIE1ha2Ugc29jX2Nsa19kdW1wIGluIGNtZC9jbGsuYyBz
dGF0aWMgaW5zdGVhZCBvZiByZW1vdmluZyBfX3dlYWsNCj4+DQo+PiDCoCB2MyAtPiB2NDoNCj4+
IMKgIC0gUmViYXNlIGFuZCByZWZhY3RvciBkdW1wIGZvciBuZXcgQW1sb2dpYyBBMSBjbG9jayBj
b250cm9sbGVyIGRyaXZlcg0KPj4NCj4+IMKgIHY0IC0+IHY1Og0KPj4gwqAgLSBBZGQgZG9jcyBm
b3IgZHVtcCgpIGZ1bmN0aW9uIGluIGNsa19vcHMNCj4+IMKgIC0gUHJpbnQgZHJpdmVyIGFuZCBk
ZXZpY2UgbmFtZXMgYmVmb3JlIGNhbGxpbmcgY29ycmVzcG9uZGluZyBkdW1wKCkNCj4+DQo+PiDC
oCB2NSAtPiB2NjoNCj4+IMKgIC0gZHVtcCgpIHJldHVybiB0eXBlIGNoYW5nZWQgdG8gdm9pZA0K
Pj4gwqAgLSBtZXNvbl9jbGtfZHVtcCgpIGFuZCBoZWxwZXIgZnVuY3Rpb25zIG1vdmVkIHVuZGVy
IENPTkZJR19DTURfQ0xLIHRvDQo+PiDCoMKgwqAgZml4IHVudXNlZC1mdW5jdGlvbiBkaWFnbm9z
dGljDQo+Pg0KPj4gdjYgLT4gdjc6DQo+PiDCoCAtIGZpeCByZXR1cm4gdHlwZSBvZiBrMjEwX2Ns
a19kdW1wKCkNCj4+IMKgIC0gZml4IGNsa19vcHMgZHVtcCgpIGRvY3Mgc2luY2UgaXQgcmV0dXJu
cyB2b2lkIG5vdw0KPj4NCj4+IElnb3IgUHJ1c292ICg4KToNCj4+IMKgwqAgY2xrOiB6eW5xOiBN
b3ZlIHNvY19jbGtfZHVtcCB0byBaeW5xIGNsb2NrIGRyaXZlcg0KPj4gwqDCoCBjbGs6IGFzdDI2
MDA6IE1vdmUgc29jX2Nsa19kdW1wIGZ1bmN0aW9uDQo+PiDCoMKgIGNsazogazIxMDogTW92ZSBz
b2NfY2xrX2R1bXAgZnVuY3Rpb24NCj4+IMKgwqAgY2xrOiBhbWxvZ2ljOiBNb3ZlIGRyaXZlciBh
bmQgb3BzIHN0cnVjdHMNCj4+IMKgwqAgY2xrOiBBZGQgZHVtcCBvcGVyYXRpb24gdG8gY2xrX29w
cw0KPj4gwqDCoCBjbWQ6IGNsazogVXNlIGR1bXAgZnVuY3Rpb24gZnJvbSBjbGtfb3BzDQo+PiDC
oMKgIGNsazogdHJlZXdpZGU6IHN3aXRjaCB0byBjbG9jayBkdW1wIGZyb20gY2xrX29wcw0KPj4g
wqDCoCBjbWQ6IGNsazogTWFrZSBzb2NfY2xrX2R1bXAgc3RhdGljDQo+Pg0KPj4gwqAgYXJjaC9h
cm0vbWFjaC16eW5xL2Nsay5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTcgLS0t
LS0tLS0tLS0tLS0NCj4+IMKgIGFyY2gvbWlwcy9tYWNoLXBpYzMyL2NwdS5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyMyAtLS0tLS0NCj4+IMKgIGNtZC9jbGsuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEzICsrKy0N
Cj4+IMKgIGRyaXZlcnMvY2xrL2FzcGVlZC9jbGtfYXN0MjYwMC5jwqDCoMKgwqDCoMKgIHzCoCA4
MyArKysrKysrKysrLS0tLS0tLS0tLQ0KPj4gwqAgZHJpdmVycy9jbGsvY2xrX2syMTAuY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTA0ICsrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0NCj4+IMKgIGRyaXZlcnMvY2xrL2Nsa19waWMzMi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAzNyArKysrKysrKysNCj4+IMKgIGRyaXZlcnMvY2xrL2Nsa192ZXJzYWwuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOSArKy0NCj4+IMKgIGRyaXZlcnMvY2xr
L2Nsa196eW5xLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTIgKysrKysr
KysrKysrKw0KPj4gwqAgZHJpdmVycy9jbGsvY2xrX3p5bnFtcC5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMjIgKysrLS0tDQo+PiDCoCBkcml2ZXJzL2Nsay9pbXgvY2xrLWlteDgu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTMgKy0tLQ0KPj4gwqAgZHJpdmVycy9jbGsv
bWVzb24vYTEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA1OCArKysrKyst
LS0tLS0tLQ0KPj4gwqAgZHJpdmVycy9jbGsvbXZlYnUvYXJtYWRhLTM3eHgtcGVyaXBoLmMgfMKg
IDIwICsrKy0tDQo+PiDCoCBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDEuY8KgwqDCoMKg
wqDCoCB8wqAgMzEgKystLS0tLS0NCj4+IMKgIGluY2x1ZGUvY2xrLXVjbGFzcy5owqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMyArKysrDQo+PiDCoCBpbmNsdWRlL2Ns
ay5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgMiAtDQo+PiDCoCAxNSBmaWxlcyBjaGFuZ2VkLCAyNjkgaW5zZXJ0aW9ucygrKSwgMjY4IGRl
bGV0aW9ucygtKQ0KPj4NCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
