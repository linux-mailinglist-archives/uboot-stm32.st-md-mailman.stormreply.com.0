Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F474E4270
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Mar 2022 16:00:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2842CC5EC6B;
	Tue, 22 Mar 2022 15:00:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF19FC5AB61
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Mar 2022 15:00:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22ME5QAY008901;
 Tue, 22 Mar 2022 16:00:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=uYseH7ICPGbfqV20DIEmrf5rviSIjbz86/Rv4/M4e5Q=;
 b=ohmZ2Dm1ifoSpz5N8qyqadbDY/CcaIX9QiKBC3gmNbGXu5AXPQjJ/JUtPBz8nyJAoNUd
 chQUAcpto48A0NsDpl8335tXiuNkhTwyl1tbmBEkkboAcMVAewPto9fJ0BJkXdYgx1PE
 6RiUmX4A0s9Im2eVAD12ACtj4VgzEsvM77YhE6hktA3J50SHy/1kOvblOCNpmApr7Iwt
 Bh9rbsZ8ND9i1uNbfyccWBLHjFrHNmt+3BN6LaxO1fhvtuNm3X7owxen82/tQVjXCtob
 7WaiS9yg5LDktSGRRVBzwuLUkX5iioNI9KjpJ2B9yk7T85LZo6mFWj+G1+EsCNBaQEI7 Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ewr5frch2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 16:00:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4172A100034;
 Tue, 22 Mar 2022 16:00:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3957222ECF9;
 Tue, 22 Mar 2022 16:00:00 +0100 (CET)
Received: from [10.48.0.213] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 22 Mar
 2022 15:59:59 +0100
Message-ID: <f5943dd2-f22f-1792-1cd5-6e581c444160@foss.st.com>
Date: Tue, 22 Mar 2022 15:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220322151000.1.I87cd34696829974a97e4eae53f9652577d6e2e4b@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220322151000.1.I87cd34696829974a97e4eae53f9652577d6e2e4b@changeid>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_06,2022-03-22_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Artem Lapkin <email2tema@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Simon Glass <sjg@chromium.org>, Zhaofeng Li <hello@zhaofeng.li>
Subject: Re: [Uboot-stm32] [PATCH] cmd: pxe_utils: sysboot: replace cls
 command by video_clear in PXE parser
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

SGksCgpPbiAzLzIyLzIyIDE1OjEwLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+IFNpbmNlIHRo
ZSBjb21taXQgYmZhYTUxZGQ0YWRmICgiY21kOiBhZGQgc2VyaWFsIGNvbnNvbGUgc3VwcG9ydAo+
IGZvciB0aGUgY2xzIGNvbW1hbmQiKSB0aGUgY2xzIGNvbW1hbmQgaXMgbm90IGVub3VnaCB0byBj
bGVhciB0aGUKPiB2aWRlbyBkaXNwbGF5IHdoZW4gQU5TSSBjb25zb2xlIGlzIGFjdGl2YXRlZC4K
Pgo+IFRoaXMgcGF0Y2ggY2xlYXJzIHRoZSB2aWRlbyBkZXZpY2Ugd2l0aCB0aGUgdmlkZW9fY2xl
YXIoKSBBUEkKPiBiZWZvcmUgdG8gZGlzcGxheSB0aGUgYml0bWFwIHVzZWQgZm9yIHRoZSBQWEUg
YmFja2dyb3VuZC4KPgo+IFRoaXMgcGF0Y2ggYXZvaWRzIHRvIGRpc3BsYXkgdGhlIExPR08sIGFj
dGl2YXRlZCBieSBkZWZhdWx0IHdpdGgKPiBjb21taXQgN2E4NTU1ZDg3MTM2ICgidmlkZW86IFNo
b3cgdGhlIFUtQm9vdCBsb2dvIGJ5IGRlZmF1bHQiKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gLS0tCj4KPiAgIGJv
b3QvcHhlX3V0aWxzLmMgfCA5ICsrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9ib290L3B4ZV91dGlscy5j
IGIvYm9vdC9weGVfdXRpbHMuYwo+IGluZGV4IDBjMjRiZWNhZTMuLjExNWQzM2I4NDUgMTAwNjQ0
Cj4gLS0tIGEvYm9vdC9weGVfdXRpbHMuYwo+ICsrKyBiL2Jvb3QvcHhlX3V0aWxzLmMKPiBAQCAt
MTQsNiArMTQsNyBAQAo+ICAgI2luY2x1ZGUgPGxjZC5oPgo+ICAgI2luY2x1ZGUgPG5ldC5oPgo+
ICAgI2luY2x1ZGUgPGZkdF9zdXBwb3J0Lmg+Cj4gKyNpbmNsdWRlIDx2aWRlby5oPgo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2xpYmZkdC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgo+ICAg
I2luY2x1ZGUgPGxpbnV4L2N0eXBlLmg+Cj4gQEAgLTE1MTEsMTMgKzE1MTIsMTcgQEAgdm9pZCBo
YW5kbGVfcHhlX21lbnUoc3RydWN0IHB4ZV9jb250ZXh0ICpjdHgsIHN0cnVjdCBweGVfbWVudSAq
Y2ZnKQo+ICAgCXZvaWQgKmNob2ljZTsKPiAgIAlzdHJ1Y3QgbWVudSAqbTsKPiAgIAlpbnQgZXJy
Owo+ICsJc3RydWN0IHVkZXZpY2UgKmRldjsKPiAgIAo+ICAgCWlmIChJU19FTkFCTEVEKENPTkZJ
R19DTURfQk1QKSkgewo+ICAgCQkvKiBkaXNwbGF5IEJNUCBpZiBhdmFpbGFibGUgKi8KPiAgIAkJ
aWYgKGNmZy0+Ym1wKSB7Cj4gICAJCQlpZiAoZ2V0X3JlbGZpbGUoY3R4LCBjZmctPmJtcCwgaW1h
Z2VfbG9hZF9hZGRyLCBOVUxMKSkgewo+IC0JCQkJaWYgKENPTkZJR19JU19FTkFCTEVEKENNRF9D
TFMpKQo+IC0JCQkJCXJ1bl9jb21tYW5kKCJjbHMiLCAwKTsKPiArCQkJCWlmIChJU19FTkFCTEVE
KENPTkZJR19ETV9WSURFTykpIHsKPiArCQkJCQllcnIgPSB1Y2xhc3NfZmlyc3RfZGV2aWNlX2Vy
cihVQ0xBU1NfVklERU8sICZkZXYpOwo+ICsJCQkJCWlmICghZXJyKQo+ICsJCQkJCQl2aWRlb19j
bGVhcihkZXYpOwo+ICsJCQkJfQo+ICAgCQkJCWJtcF9kaXNwbGF5KGltYWdlX2xvYWRfYWRkciwK
PiAgIAkJCQkJICAgIEJNUF9BTElHTl9DRU5URVIsIEJNUF9BTElHTl9DRU5URVIpOwo+ICAgCQkJ
fSBlbHNlIHsKCgpuZWVkIFYyLCB0aGlzIHBhdGNoIGhhdmUgY29tcGlsYXRpb24gaXNzdWVzIGZv
ciBzb21lIGRlZmNvbmZpZwoKLSB1bmtub3duwqAgdWNsYXNzX2ZpcnN0X2RldmljZV9lcnIgPT4g
ImRtLmgiIGlzIG9ubHkgaW5jbHVkZWQgd2hlbiAKQ09ORklHX0RNX1JORyBpcyBhY3RpdmF0ZWQK
Ci0gdmlkZW9fY2xlYXIoZGV2KSA9PiB0b28gbWFueSBhcmd1bWVudCB3aGVuIENPTkZJR19ETV9W
SURFTyBpcyBub3QgCmFjdGl2YXRlZAoKUmVnYXJkcwoKUGF0cmljawoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0
ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
