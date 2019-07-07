Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8573568397
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jul 2019 08:37:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35F37C46D4D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jul 2019 06:37:20 +0000 (UTC)
Received: from koncepto.io (koncepto.io [195.154.119.111])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EE17C7B4D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jul 2019 18:14:07 +0000 (UTC)
Received: from [192.168.1.17] (lfbn-1-8923-205.w193-250.abo.wanadoo.fr
 [193.250.65.205])
 by koncepto.io (Postfix) with ESMTPSA id DC7B960046;
 Sun,  7 Jul 2019 20:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
 s=default; t=1562523244;
 bh=dPBrguyu0IJSN2s38cBcSQ/CQFQoKDeFhPFT703z3o8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=J+zH7D30gamNXVd270fjiblvmA4DiJJa/gJtb4H9SN+rP/DGIxwAC2KvAWvAvaaMg
 AUqazY1QZYtUpvYZVsbqpPGDPbIW84Mjex3A8WiOHVtF51GHIE6pzwCXN7fXcx3U0z
 ZgWVroIp918Yosulwke49yx5a7EPyKCdDcNNFVVx3TPFWUfv7935GN3nn6cWrUUnv8
 EzjJ5koBBT2HmaSHusetHf1vGrDKLBjstkNAsyIDU//bpFbZ9fuoVWh8p2VWrl7Elh
 4pIFvqhMG3N54hXGqwfm1T684SmIccdLVbFUfx3cDg2qLY76JN0axvYeFsR3C404Lg
 uLPuFLqKoExOA==
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
 <1562340023-8516-15-git-send-email-patrick.delaunay@st.com>
From: Pierre-Jean Texier <pjtexier@koncepto.io>
Message-ID: <32790914-14a3-a829-13bd-80ef09701e2e@koncepto.io>
Date: Sun, 7 Jul 2019 20:14:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1562340023-8516-15-git-send-email-patrick.delaunay@st.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 15 Jul 2019 06:37:19 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 14/16] stm32mp1: add check for
 presence of environment in boot device
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

TGUgMDUvMDcvMjAxOSDDoCAxNzoyMCwgUGF0cmljayBEZWxhdW5heSBhIMOpY3JpdMKgOgo+IEZv
ciBib290IGZyb20gZmxhc2gsIGNoZWNrIHByZXNlbmNlIG9mIGRlZmF1bHQgZW52aXJvbm1lbnQg
dG8gZm9yY2UKPiBzYXZlIGVudi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5
IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4KPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHYyOiBOb25l
Cj4gCj4gICBpbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDEuaCB8IDQgKysrKwo+ICAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2NvbmZpZ3Mv
c3RtMzJtcDEuaCBiL2luY2x1ZGUvY29uZmlncy9zdG0zMm1wMS5oCj4gaW5kZXggMWQzODVlMC4u
NmM3NGI0YiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDEuaAo+ICsrKyBi
L2luY2x1ZGUvY29uZmlncy9zdG0zMm1wMS5oCj4gQEAgLTExMiw2ICsxMTIsNyBAQAo+ICAgCSJp
ZiB0ZXN0ICR7Ym9vdF9kZXZpY2V9ID0gc2VyaWFsIHx8IHRlc3QgJHtib290X2RldmljZX0gPSB1
c2I7IiBcCj4gICAJInRoZW4gc3RtMzJwcm9nICR7Ym9vdF9kZXZpY2V9ICR7Ym9vdF9pbnN0YW5j
ZX07ICIgXAo+ICAgCSJlbHNlICIgXAo+ICsJCSJydW4gZW52X2NoZWNrOyIgXAo+ICAgCQkiaWYg
dGVzdCAke2Jvb3RfZGV2aWNlfSA9IG1tYzsiIFwKPiAgIAkJInRoZW4gZW52IHNldCBib290X3Rh
cmdldHMgXCJtbWMke2Jvb3RfaW5zdGFuY2V9XCI7IGZpOyIgXAo+ICAgCQkiaWYgdGVzdCAke2Jv
b3RfZGV2aWNlfSA9IG5hbmQ7IiBcCj4gQEAgLTE0Myw2ICsxNDQsOSBAQAo+ICAgCSJyYW1kaXNr
X2FkZHJfcj0weGM0NDAwMDAwXDAiIFwKPiAgIAkiZmR0X2hpZ2g9MHhmZmZmZmZmZlwwIiBcCj4g
ICAJImluaXRyZF9oaWdoPTB4ZmZmZmZmZmZcMCIgXAo+ICsJImVudl9kZWZhdWx0PTFcMCIJCQkJ
XAo+ICsJImVudl9jaGVjaz1pZiB0ZXN0ICRlbnZfZGVmYXVsdCAtZXEgMTsiXAo+ICsJCSIgdGhl
biBlbnYgc2V0IGVudl9kZWZhdWx0IDA7ZW52IHNhdmU7ZmlcMCIgXAo+ICAgCVNUTTMyTVBfQk9P
VENNRCBcCj4gICAJU1RNMzJNUF9NVERQQVJUUyBcCj4gICAJQk9PVEVOVgo+IAoKVGVzdGVkOiBz
dG0zMm1wMTU3YS1kazEgKE9TIEJ1aWxkcm9vdCB3aXRoIF5tZXRhZGF0YV9jc3VtIG9wdGlvbiBm
b3IKbWtlMmZzKQoKU1RNMzJNUD4gZW52IHByaW50IGVudl9kZWZhdWx0CmVudl9kZWZhdWx0PTEK
U1RNMzJNUD4gcnVuIGJvb3RjbWQKQm9vdCBvdmVyIG1tYzAhClNhdmluZyBFbnZpcm9ubWVudCB0
byBFWFQ0Li4uIEpvdXJuYWwgU2NhbiBDb21wbGV0ZWQKUmVjb3ZlcnkgcmVxdWlyZWQKSm91cm5h
bCBSZWNvdmVyeSBDb21wbGV0ZWQKZmlsZSBmb3VuZCwgZGVsZXRpbmcKdXBkYXRlIGpvdXJuYWwg
ZmluaXNoZWQKRmlsZSBTeXN0ZW0gaXMgY29uc2lzdGVudAp1cGRhdGUgam91cm5hbCBmaW5pc2hl
ZApkb25lCk9LCnN3aXRjaCB0byBwYXJ0aXRpb25zICMwLCBPSwptbWMwIGlzIGN1cnJlbnQgZGV2
aWNlClNjYW5uaW5nIG1tYyAwOjQuLi4KRm91bmQgL2Jvb3QvZXh0bGludXgvZXh0bGludXguY29u
ZgpSZXRyaWV2aW5nIGZpbGU6IC9ib290L2V4dGxpbnV4L2V4dGxpbnV4LmNvbmYKMTI1IGJ5dGVz
IHJlYWQgaW4gMyBtcyAoNDAgS2lCL3MpCjE6ICAgICAgc3RtMzJtcDE1LWJ1aWxkcm9vdApSZXRy
aWV2aW5nIGZpbGU6IC9ib290L3pJbWFnZQozOTQ4MzIwIGJ5dGVzIHJlYWQgaW4gMTcwIG1zICgy
Mi4xIE1pQi9zKQphcHBlbmQ6IHJvb3Q9L2Rldi9tbWNibGswcDQgcm9vdHdhaXQKUmV0cmlldmlu
ZyBmaWxlOiAvYm9vdC9zdG0zMm1wMTU3YS1kazEuZHRiCjM4Njk4IGJ5dGVzIHJlYWQgaW4gNSBt
cyAoNy40IE1pQi9zKQouLi4KClNvLAoKVGVzdGVkLWJ5OiBQaWVycmUtSmVhbiBUZXhpZXIgPHBq
dGV4aWVyQGtvbmNlcHRvLmlvPgoKUmVnYXJkcywKLS0gClBpZXJyZS1KZWFuIFRleGllcgpFbWJl
ZGRlZCBMaW51eCBFbmdpbmVlcgpodHRwczovL2tvbmNlcHRvLmlvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
