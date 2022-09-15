Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C77E95B9E95
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 17:18:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95DADC03FE0;
	Thu, 15 Sep 2022 15:18:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D69AC03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 15:18:58 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FBA7Fk002109;
 Thu, 15 Sep 2022 17:18:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xN1vVoF5g1fDd9JniqJCv3plqR7rHNvOcskBZKf36Ec=;
 b=GJtyjBwuCQSE0TBN5m9kSbaXMl4TGRLoOJ+XPP3bDscepwet8dkYFhI48uzNZYBgVXXc
 /tewM1jF9reUjdVLjHM6LVwCi6TaMdeR+L1MEarUw8+kINPFUQPyguKYWd4YviUTpyEY
 kM2S2ilBcnE9cYvVlgFolfJ0yyhHdVcOpj0kkzGzA+cec6Y3vdr7PagOAEsmhAjWP5Db
 5RflIs3f3wbzehvLoFS33lXUvtZGXhXpFHwZ1D75IZVGnPEPmWD/xJ/b4LmDP/ORFfWp
 +kOBvBfF5NB/xS4ia4gjdqdE+VLzWjuu2qYwUiONhInSsYN8dEqYT4knEcnfr4RNoeYB +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jjxxxwh51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 17:18:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 558EB10002A;
 Thu, 15 Sep 2022 17:18:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 518EB231DEB;
 Thu, 15 Sep 2022 17:18:55 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 17:18:54 +0200
Message-ID: <b6bf86e8-e2d1-5c9c-d9be-58cd07ef4983@foss.st.com>
Date: Thu, 15 Sep 2022 17:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>, <u-boot@lists.denx.de>
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-2-alain.volmat@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220912084201.1826979-2-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, uboot-stm32@st-md-mailman.stormreply.com,
 hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v4 1/4] i2c: stm32: fix comment and remove
 unused AUTOEND bit
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

SGkgQWxhaW4sCgpPbiA5LzEyLzIyIDEwOjQxLCBBbGFpbiBWb2xtYXQgd3JvdGU6Cj4gQ29tbWVu
dCB3aXRoaW4gc3RtMzJfaTJjX21lc3NhZ2Vfc3RhcnQgaXMgbWlzbGVhZGluZywgaW5kaWNhdGlu
Zwo+IHRoYXQgQVVUT0VORCBiaXQgaXMgc2V0dGVkIHdoaWxlIGl0IGlzIGFjdHVhbGx5IGNsZWFy
ZWQuCj4gTW9yZW92ZXIsIHRoZSBiaXQgaXMgYWN0dWFsbHkgbmV2ZXIgc2V0dGVkIHNvIHRoZXJl
IGlzIG5vIG5lZWQKPiB0byBjbGVhciBpdCBoZW5jZSBnZXQgcmlkIG9mIHRoaXMgYml0IGNsZWFy
IGFuZCB0aGUgYml0IG1hY3JvCj4gYXMgd2VsbC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsYWluIFZv
bG1hdCA8YWxhaW4udm9sbWF0QGZvc3Muc3QuY29tPgo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERl
bGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9p
MmMvc3RtMzJmN19pMmMuYyB8IDYgKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL3N0bTMy
ZjdfaTJjLmMgYi9kcml2ZXJzL2kyYy9zdG0zMmY3X2kyYy5jCj4gaW5kZXggYmYyYTZjOWI0Yi4u
NzhkNzE1NjQ5MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kyYy9zdG0zMmY3X2kyYy5jCj4gKysr
IGIvZHJpdmVycy9pMmMvc3RtMzJmN19pMmMuYwo+IEBAIC01Nyw3ICs1Nyw2IEBAIHN0cnVjdCBz
dG0zMl9pMmNfcmVncyB7Cj4gICAjZGVmaW5lIFNUTTMyX0kyQ19DUjFfUEUJCQlCSVQoMCkKPiAg
IAo+ICAgLyogU1RNMzIgSTJDIGNvbnRyb2wgMiAqLwo+IC0jZGVmaW5lIFNUTTMyX0kyQ19DUjJf
QVVUT0VORAkJCUJJVCgyNSkKPiAgICNkZWZpbmUgU1RNMzJfSTJDX0NSMl9SRUxPQUQJCQlCSVQo
MjQpCj4gICAjZGVmaW5lIFNUTTMyX0kyQ19DUjJfTkJZVEVTX01BU0sJCUdFTk1BU0soMjMsIDE2
KQo+ICAgI2RlZmluZSBTVE0zMl9JMkNfQ1IyX05CWVRFUyhuKQkJCSgobiAmIDB4ZmYpIDw8IDE2
KQo+IEBAIC0zMDQsOSArMzAzLDggQEAgc3RhdGljIHZvaWQgc3RtMzJfaTJjX21lc3NhZ2Vfc3Rh
cnQoc3RydWN0IHN0bTMyX2kyY19wcml2ICppMmNfcHJpdiwKPiAgIAkJY3IyIHw9IFNUTTMyX0ky
Q19DUjJfU0FERDcobXNnLT5hZGRyKTsKPiAgIAl9Cj4gICAKPiAtCS8qIFNldCBuYiBieXRlcyB0
byB0cmFuc2ZlciBhbmQgcmVsb2FkIG9yIGF1dG9lbmQgYml0cyAqLwo+IC0JY3IyICY9IH4oU1RN
MzJfSTJDX0NSMl9OQllURVNfTUFTSyB8IFNUTTMyX0kyQ19DUjJfUkVMT0FEIHwKPiAtCQkgU1RN
MzJfSTJDX0NSMl9BVVRPRU5EKTsKPiArCS8qIFNldCBuYiBieXRlcyB0byB0cmFuc2ZlciBhbmQg
cmVsb2FkIChpZiBuZWVkZWQpICovCj4gKwljcjIgJj0gfihTVE0zMl9JMkNfQ1IyX05CWVRFU19N
QVNLIHwgU1RNMzJfSTJDX0NSMl9SRUxPQUQpOwo+ICAgCWlmIChtc2ctPmxlbiA+IFNUTTMyX0ky
Q19NQVhfTEVOKSB7Cj4gICAJCWNyMiB8PSBTVE0zMl9JMkNfQ1IyX05CWVRFUyhTVE0zMl9JMkNf
TUFYX0xFTik7Cj4gICAJCWNyMiB8PSBTVE0zMl9JMkNfQ1IyX1JFTE9BRDsKCgpBcHBsaWVkIHRv
IHUtYm9vdC1zdG0vbWFzdGVyLCB0aGFua3MhCgpJIGFsc28gYWRkIHRoZSBtaXNzaW5nIFJldmll
d2VkLWJ5IHdoZW4gSSBnZXQgdGhlIHBhdGNoIGZyb20gcGF0Y2h3b3JrCgpodHRwOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC91Ym9vdC9wYXRjaC8yMDIyMDkxMjA4NDIwMS4xODI2OTc5
LTItYWxhaW4udm9sbWF0QGZvc3Muc3QuY29tLwoKK8KgwqDCoCBSZXZpZXdlZC1ieTogSGVpa28g
U2Nob2NoZXIgPGhzQGRlbnguZGU+CivCoMKgwqAgUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFy
ZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgoKClJlZ2FyZHMKUGF0cmljawoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
