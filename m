Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A7597508F
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Sep 2024 13:12:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B23A1C78015;
	Wed, 11 Sep 2024 11:12:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D0D0C6C83A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 11:12:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42cb58d810eso4689955e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726053144; x=1726657944;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+BLboQbXhdCwMl/iWzMvCQHIcbC1vAot4nazbVtFUk=;
 b=IqMq4glu89wp2FNORqNrNYgLAah2sHwnPIlCBUbo2QyZKMxTQSE8i+Pkyb47EbiJo5
 XOm2gJc05/B8tQ4ZRf9w+U8NkymXWdnK6W/rloZ/8+EWBrorZfDj5qoZ7wjDyoz6MAnQ
 BQhz+LycwqohfDgUNjfAkQ648W3vc8E3atYh82VP34LfKh1PeMD5S5S65QMZqFJCfiT4
 OTIwjgNSsx+t8QavyIW7F/dVoiCAdGibmPcw70dUsJp+M8tZ9/fmt1RzLeer/yEH74JJ
 Y84mnRa9fpsgMehW6mGeJtbpJw/i8PzzrWJ77C+Vr+luj8RwLkBn4GjJc7t1EwfQw4u5
 gHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726053144; x=1726657944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y+BLboQbXhdCwMl/iWzMvCQHIcbC1vAot4nazbVtFUk=;
 b=gZUmqNfdvsiIDdTQFCkBmumAaXiZ5ylE9DmLXFsAX5dDSqfDlcUKqAQoTNA3M/pxwW
 5rU6CKJLaGEHU3j67XnGQrRIBBg36TtSgmyx3Z8VjWJGVE83CHzfS6jBQBAtPIyF7Ybb
 vVQRYn1julbv4Sb6vDW8JpxzjSp5HnpmckBR2DzrHwT7CqIuRMYBHWhgSnaS2Lnwl9+0
 ZmrcnP/h/LC1zWUQ1NEJG24Zq23w51b9nfAKo6pz6eG4ZDhcMhwnl2AUCmsKj77oKYT+
 d991tJ9RRo4xUdQ/U/jmEUouQe4dIFgIje0Kv733zKHwx2Yms79YIQVbLQl2eAcMEvo0
 U8HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWytaUSb96J0YcfM4pWvmYNOXXoZ1H9ptoh8aTtU8B087LcupA6ociOtrAsMqXr1QWcSg6GbYeD7+X24Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywxueax0Xy20TlIgNszt/WFT8wdwFu5N4sC6Qc3DqlkaQ3IDJNx
 jdszOc6wAlJtj0xiIBW4+RG/cnNKLsnRT75RF3J3ll90DP1azcxT2lG9fOt95bdt7PAUCi8J0EZ
 jB8tRFlXAsgKJnk8I5HhXDlRyZytuLo4k
X-Google-Smtp-Source: AGHT+IEx7XOYNRr/D4/84V9Zzu5PALu3PVctmPJDfr8baDh0VkpsqYYqezSJYG5M7VZnIqag7EzaPUl1z1cAyLQPwD8=
X-Received: by 2002:adf:e8cd:0:b0:374:c33d:377d with SMTP id
 ffacd0b85a97d-378a8aae3ffmr3740551f8f.28.1726053143444; Wed, 11 Sep 2024
 04:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
 <CAPVz0n0C6TPdBRUEvJmgAUGAKoetuzr1j=0cMXweP2EqMTwn=g@mail.gmail.com>
 <0910419d-e8ab-4bf9-a083-dc2783afaca1@denx.de>
 <4D07A6E5-F156-44C3-A26D-0F2D913CE92D@gmail.com>
 <18d84528-d2e5-41d6-ae1d-109ee30853b2@denx.de>
 <CAPVz0n2Jzfih0Z85TSQbnz-8OrX4D6UN=anKGTJ=hckRt8f3xA@mail.gmail.com>
 <a95f0d60-2883-4c3d-8a53-ee3ef414cc32@denx.de>
 <CAPVz0n3Ji1sKQK+Lnq8rP3ZqwX3o-kXe2btj93UuVBa3T5C=qw@mail.gmail.com>
 <eced1020-2157-44a4-98a9-845e218529d9@denx.de>
 <45c74c58-98cf-43df-b837-c48b0341c551@denx.de>
 <CAPVz0n2-DCKDcVrAi00kF6yDcE2bN1mtUhzBcw7JDiZoXgzu0w@mail.gmail.com>
 <e5837ce4-0a14-4822-960d-6ab667a9f4b1@denx.de>
 <CAPVz0n323ktF6kb3WHR9JcE+xOzQr9-aWOR47+ZvwQr=ib18rg@mail.gmail.com>
 <f778366b-bdaf-415d-a94e-c995f62e8c71@denx.de>
 <CAPVz0n0ru1rPb9SNw515mkwfs4=nNSOPjZY74JVkqnGbEouSLQ@mail.gmail.com>
 <cfc1a158-6c35-4288-aed0-fcc78a8db832@denx.de>
In-Reply-To: <cfc1a158-6c35-4288-aed0-fcc78a8db832@denx.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 11 Sep 2024 14:12:12 +0300
Message-ID: <CAPVz0n1Vh7Vgnt8_Lx6U8p42QvtVnHB9yvb=RmjYrS=w1G3u1A@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] power: regulator: Trigger probe of
 regulators which are always-on or boot-on
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

0YHRgCwgMTEg0LLQtdGALiAyMDI04oCv0YAuINC+IDE0OjAxIE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPiDQv9C40YjQtToKPgo+IE9uIDkvMTEvMjQgNzo1NyBBTSwgU3Z5YXRvc2xhdiBSeWhl
bCB3cm90ZToKPgo+IFsuLi5dCj4KPiA+Pj4+IFlvdSBkaWQgbWVudGlvbiBzb21ldGhpbmcgcmVn
YXJkaW5nIEkyQy9QTUlDIGRyaXZlciBwcm9iZSB0aW1pbmcsIGJ1dCBpdAo+ID4+Pj4gc2VlbXMg
dGhlIEkyQyBkcml2ZXIgYW5kIFBNSUMgZHJpdmVycyBwcm9iZSByb3VnaGx5IGFyb3VuZCB0aGUg
c2FtZSB0aW1lCj4gPj4+PiBpbiBib3RoIHBhc3MgYW5kIGZhaWwgY2FzZXMgPwo+ID4+Pgo+ID4+
PiBZZXMsIGhlcmUgSSBhZ3JlZSB0aGF0IHRoZXkgYm90aCBwcm9iZSBhbmQgcHJvYmUgcGFzc2Vz
LCBidXQgSSBhc3N1bWUKPiA+Pj4gdGltaW5nIG9mIGkyYyBjYWxsIGlzIGNyaXRpY2FsIGFuZCB0
aGVyZSBtYXkgYmUgc29tZSBkZXBlbmRlbmN5IHdoaWNoCj4gPj4+IGlzIG5vdCByZWFkeS4KPiA+
Pgo+ID4+IE15IGd1ZXNzIHdvdWxkIGJlIHBpbm11eCBvciBjbG9jaywgbWF5YmUgdGhlIGkyYyBj
b250cm9sbGVyIGlzIG1hcmtlZCBhcwo+ID4+IGJvb3RwaC0qIGluIERUIGFuZCBpdHMgcGlubXV4
L2Nsb2NrIGlzIG5vdD8gTWF5YmUgdGhlIGkyYyBvbiB0ZWdyYSB3b3Jrcwo+ID4+IGJ5IHNoZWVy
IGNvaW5jaWRlbmNlIHJpZ2h0IG5vdz8gQ2FuIHlvdSBoYXZlIGEgbG9vaz8KPiA+Cj4gPiBQb3dl
ciBpMmMgbGluZSAob25lIHRoYXQgaG9zdHMgUE1JQykgaXMgY29uZmlndXJlZCBleHRyZW1lbHkg
ZWFybHkgaW4KPiA+IFNQTCBzaW5jZSBpdCBpcyBuZWVkZWQgZm9yIGNwdSBhbmQgY29yZSB2b2x0
YWdlIHNldHVwIHNvIGV2ZW4gaWYsIGFzCj4gPiB5b3Ugc2F5LCB0ZWdyYSB3b3JrcyBieSBzaGVl
ciBjb2luY2lkZW5jZSwgc3BlY2lmaWNhbGx5IHRoaXMgaTJjIGxpbmUKPiA+IHNob3VsZCB3b3Jr
IG5vbiB0aGUgbGVzcywgc2luY2UgaXQgaGFzIGFsbCBpdHMgcHJlLXJlcXVpc2l0ZXMgKGNsb2Nr
Cj4gPiBhbmQgcGlubXV4KSBjb25maWd1cmVkIG9uIGVhcmx5IHN0YWdlLgo+Cj4gSXMgaXQgcG9z
c2libGUgdGhhdCB0aGlzIGNvbmZpZ3VyYXRpb24gaXMgc29tZWhvdyByZXNldCBvciByZWNvbmZp
Z3VyZWQKPiBmcm9tIERUIGVhcmx5IG9uIGluIFUtQm9vdCBwcm9wZXIgPwoKTm8KCj4gRG8geW91
IGhhdmUgc2VyaWFsIGNvbnNvbGUgb3V0cHV0IGluIGJvYXJkX2YuYyB0aW1lIGluIFUtQm9vdCBw
cm9wZXIgLAo+IHBvc3NpYmx5IHVzaW5nIERFVUJHX1VBUlQgLCB0byBjaGVjayBpZiB0aGVyZSBt
aWdodCBiZSBzb21lIHByaW9yCj4gZmFpbGluZyBJMkMgdHJhbnNmZXIgYXQgdGhhdCBib2FyZF9m
LmMgdGltZSA/CgpIYXZlbid0IHNwb3R0ZWQgYW55dGhpbmcgd2VpcmQgdGhlcmUuCgo+ID4gQXMg
SSBoYXZlIHRvbGQsIEkgd2FzIG5vdCBhYmxlIHRvIGRldGVybWluZSBleGFjdCByZWFzb24gd2h5
IHRoaXMKPiA+IGhhcHBlbnMsIGl0IHNob3VsZCBub3QgYW5kIHlldCBpdCBkb2VzLiBUaGlzIGlz
IHdoeSBJIGhhdmUgYWJhbmRvbmVkCj4gPiBteSBhdHRlbXB0IHRvIGltcGxlbWVudCBzYW1lIGNo
YW5nZXMgeW91IGFyZSBjdXJyZW50bHkgcHJvcG9zaW5nLgo+Cj4gSWYgdGVncmEgaGFzIGEgcHJv
YmxlbSwgaXQgc2hvdWxkIGJlIGZpeGVkIG9uIHRlZ3JhIHNpZGUgYW5kIG5vdCBibG9jawo+IGNv
cmUgcGx1bWJpbmcuIEkgYW0gbm90IHNlZWluZyB0aGUgcHJvYmxlbSBvbiBzdG0zMiBvciBpbXgg
c3lzdGVtcywgc28gSQo+IGFtIGJhbmtpbmcgdG93YXJkIHRlZ3JhLXNwZWNpZmljIGlzc3VlLgo+
CgpBbmQgeWV0IHlvdSBhcmUgcHVzaGluZyB0ZWdyYSBicmVha2luZyBzdHVmZi4gSSB3aWxsIGlu
c2lzdCBvbgpyZXZlcnRpbmcgdGhpcyBpcyBpdCBwYXNzZXMuCgo+IEFyZSB5b3UgYWJsZSB0byBk
ZWJ1ZyB0aGlzID8KCk5vLCBJIGFtIG5vdCBhYmxlIGZpbmQgZXhhY3QgY3VzZSBvZiB0aGlzIGJl
aGF2aW9yLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpV
Ym9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby91Ym9vdC1zdG0zMgo=
