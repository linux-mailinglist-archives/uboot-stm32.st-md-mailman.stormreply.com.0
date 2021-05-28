Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D8E394301
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 14:53:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2B0AC5718D;
	Fri, 28 May 2021 12:53:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9471C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 12:53:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SCqLmA013207; Fri, 28 May 2021 14:53:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OwBLzFzecmm8GSg5zXQ0raQmi35c2kyhuVPHDg9zHuM=;
 b=GyJldnEclkVWsAbExhNr7CNtn6LxnQEr8VI83H8UFN50I+6A9Cdtyq5ZBZEgsum19O+w
 3a67WG5/szezXfba52essldBwQ1zfvye1PXW2gpxESHg2g3vVXQNKKouh9GE+RDSKV/s
 30NDUh7k0i0FL/G6lfhfGr4CEsCJJy3qmp07uoDKfw894/KUJ5SXcHa2OG7mgom7ZzrJ
 v/zU+3IuKGKPKrawzy/FokXgBgGh7ro8KeSpHdLBvVdx0k52F9kzqV3uLd0ZMf80L9s5
 kn/SIc+emWxdO2o7PvoQihejbNRYWfVb5/LSy/yD9F+Nht/eO7oteOeKwav4VvQecos4 Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38tsq0jhqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 14:53:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D084C10002A;
 Fri, 28 May 2021 14:53:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4BFD2291B2;
 Fri, 28 May 2021 14:53:45 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 14:53:45 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.4.I44c0cbd50fa01f82729d1d6d435d0f663b9e7dcb@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20c75ee4-fffd-80f5-eab2-93d732a497c5@foss.st.com>
Date: Fri, 28 May 2021 14:53:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518151206.4.I44c0cbd50fa01f82729d1d6d435d0f663b9e7dcb@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 04/10] stm32mp: stm32prog: solve
 compilation with CONFIG_FIT_SIGNATURE
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

SGkgUGF0cmljawoKT24gNS8xOC8yMSAzOjEyIFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+
IFdoZW4gQ09ORklHX0ZJVF9TSUdOQVRVUkUgaXMgYWN0aXZhdGVkLCBDT05GSUdfTEVHQUNZX0lN
QUdFX0ZPUk1BVAo+IGlzIGRlYWN0aXZhdGVkIGFuZCB0aGUgZGVmaW5lIElNQUdFX0ZPUk1BVF9M
RUdBQ1kgZG9uJ3QgZXhpc3Qgd2l0aAo+IGluY2x1ZGUvaW1hZ2UuaDoKPiAgICNpZiBkZWZpbmVk
KENPTkZJR19MRUdBQ1lfSU1BR0VfRk9STUFUKQo+ICAgI2RlZmluZSBJTUFHRV9GT1JNQVRfTEVH
QUNZCTB4MDEJLyogbGVnYWN5IGltYWdlX2hlYWRlciBiYXNlZCBmb3JtYXQgKi8KPiAgICNlbmRp
Zgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgbmVlZGVkIGNoZWNrIG9uIGNvbXBpbGF0aW9uIGZs
YWcKPiBDT05GSUdfTEVHQUNZX0lNQUdFX0ZPUk1BVCB0byBhdm9pZCB0aGUgY29tcGlsYXRpb24g
ZXJyb3IKPiBmb3IgY29tbWFuZCBzdG0zMnByb2c6Cj4gCj4gY21kX3N0bTMycHJvZy5jOjgxOjg6
IGVycm9yOiDigJhJTUFHRV9GT1JNQVRfTEVHQUNZ4oCZIHVuZGVjbGFyZWQKPiAoZmlyc3QgdXNl
IGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYSU1BR0VfRk9STUFUX0ZJVOKAmT8K
PiAgICA4MSB8ICAgIGlmIChJTUFHRV9GT1JNQVRfTEVHQUNZID09Cj4gICAgICAgfCAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgIHwgICAgICAgIElNQUdFX0ZPUk1BVF9GSVQKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Mu
c3QuY29tPgo+IC0tLQo+IAo+ICBhcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9j
bWRfc3RtMzJwcm9nLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvY21k
X3N0bTMycHJvZy5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvY21kX3N0
bTMycHJvZy5jCj4gaW5kZXggZTU4NGJiNTJiZC4uZjM3OTBmOTAwZiAxMDA2NDQKPiAtLS0gYS9h
cmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9jbWRfc3RtMzJwcm9nLmMKPiArKysg
Yi9hcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9jbWRfc3RtMzJwcm9nLmMKPiBA
QCAtNzcsMTAgKzc3LDEyIEBAIHN0YXRpYyBpbnQgZG9fc3RtMzJwcm9nKHN0cnVjdCBjbWRfdGJs
ICpjbWR0cCwgaW50IGZsYWcsIGludCBhcmdjLAo+ICAJCWlmIChoZWFkZXIudHlwZSA9PSBIRUFE
RVJfU1RNMzJJTUFHRSkgewo+ICAJCQlzaXplID0gaGVhZGVyLmltYWdlX2xlbmd0aCArIEJMX0hF
QURFUl9TSVpFOwo+ICAKPiArI2lmIGRlZmluZWQoQ09ORklHX0xFR0FDWV9JTUFHRV9GT1JNQVQp
Cj4gIAkJCS8qIHVJbWFnZSBkZXRlY3RlZCBpbiBTVE0zMklNQUdFLCBleGVjdXRlIHRoZSBzY3Jp
cHQgKi8KPiAgCQkJaWYgKElNQUdFX0ZPUk1BVF9MRUdBQ1kgPT0KPiAgCQkJICAgIGdlbmltZ19n
ZXRfZm9ybWF0KCh2b2lkICopKGFkZHIgKyBCTF9IRUFERVJfU0laRSkpKQo+ICAJCQkJcmV0dXJu
IGltYWdlX3NvdXJjZV9zY3JpcHQoYWRkciArIEJMX0hFQURFUl9TSVpFLCAic2NyaXB0QDEiKTsK
PiArI2VuZGlmCj4gIAkJfQo+ICAJfQo+ICAKPiAKUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFy
ZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
