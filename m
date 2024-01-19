Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C0B832A50
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jan 2024 14:25:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F951C6DD74;
	Fri, 19 Jan 2024 13:25:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88693C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 13:25:39 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JAn3YG005633; Fri, 19 Jan 2024 14:25:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=pg+TLZzW7eYdRK5gwHyF3WZD1pJmJqyVvxqzF2SBJbM=; b=0C
 SmWkslBhceVwP8A2KBqo8CVowgJxcSAxbGR2L8UmVZtxAhcjKZ5AhrMCEEZ4LDnK
 lpFxAw9tMgoNyDFtWKs+e57/NQSZG7MrzjLmRakBHQlyaOBHqipw3YVvHyvVcyfI
 cAEKwvLNZdnMDEav8eUmHt0oY/oJH1olmJ/5vMZ3ONHXuaSHc/I9Tpun7ms9EbMZ
 Z7NAk+2OMeKvHRMutvdC/h/jCoRmjGIAYskbEPCICNnbeVWS98oXbQREHaAROTrI
 BdelmLbR0BaADhgh6XSSKmPFUjenXpbD/k1PPx3w4i1rMyacGOT/UPuJseRxaGsn
 kpiARHkivuDX10ZcmdWw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vm4y5buck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 14:25:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4666100081;
 Fri, 19 Jan 2024 14:25:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC51E23D41E;
 Fri, 19 Jan 2024 14:25:30 +0100 (CET)
Received: from [10.252.4.250] (10.252.4.250) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Jan
 2024 14:25:29 +0100
Message-ID: <3d655b04-0b68-4804-b3b3-dcc2ede72cb8@foss.st.com>
Date: Fri, 19 Jan 2024 14:25:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Igor Opaniuk <igor.opaniuk@foundries.io>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
 <20240115150451.v2.6.I175b5b047ccdb4198f1ae11bac19411617623518@changeid>
 <CAL6CDMESvLgGFrOb2767nCUiKPJcP9XLWkY1du+sKWamZf24Mw@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAL6CDMESvLgGFrOb2767nCUiKPJcP9XLWkY1du+sKWamZf24Mw@mail.gmail.com>
X-Originating-IP: [10.252.4.250]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
Subject: Re: [Uboot-stm32] [PATCH v2 06/14] stm32mp: add soc.c file
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

CgpPbiAxLzE1LzI0IDE3OjI2LCBJZ29yIE9wYW5pdWsgd3JvdGU6Cj4gT24gTW9uLCBKYW4gMTUs
IDIwMjQgYXQgMzowN+KAr1BNIFBhdHJpY2sgRGVsYXVuYXkKPiA8cGF0cmljay5kZWxhdW5heUBm
b3NzLnN0LmNvbT4gd3JvdGU6Cj4+Cj4+IEFkZCBhIG5ldyBmaWxlIHNvYy5jIGZvciBjb21tb24g
ZnVuY3Rpb25zIGJldHdlZW4gc3RtMzJtcDEgYW5kIHN0bTMybXAyCj4+IGZhbWlseSBhbmQgbW92
ZSBwcmludF9jcHVpbmZvKCkgaW4gdGhpcyBuZXcgZmlsZS4KPj4KPj4gUmV2aWV3ZWQtYnk6IFBh
dHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2Zm
LWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiAt
LS0KPj4KPj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4+Cj4+ICBhcmNoL2FybS9tYWNoLXN0bTMy
bXAvTWFrZWZpbGUgICAgICAgfCAgMSArCj4+ICBhcmNoL2FybS9tYWNoLXN0bTMybXAvc29jLmMg
ICAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKwo+PiAgYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L3N0bTMybXAxL2NwdS5jIHwgMTEgLS0tLS0tLS0tLS0KPj4gIGFyY2gvYXJtL21hY2gtc3RtMzJt
cC9zdG0zMm1wMi9jcHUuYyB8IDExIC0tLS0tLS0tLS0tCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvYXJtL21hY2gtc3RtMzJtcC9zb2MuYwo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL01ha2VmaWxlIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL01ha2VmaWxlCj4+IGlu
ZGV4IDAwZGMyNWJiMjc1Yy4uZmRjYmJmOTFkZmQ1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9t
YWNoLXN0bTMybXAvTWFrZWZpbGUKPj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL01ha2Vm
aWxlCj4+IEBAIC02LDYgKzYsNyBAQAo+PiAgb2JqLXkgKz0gZHJhbV9pbml0Lm8KPj4gIG9iai15
ICs9IHN5c2Nvbi5vCj4+ICBvYmoteSArPSBic2VjLm8KPj4gK29iai15ICs9IHNvYy5vCj4+Cj4+
ICBvYmotJChDT05GSUdfU1RNMzJNUDE1eCkgKz0gc3RtMzJtcDEvCj4+ICBvYmotJChDT05GSUdf
U1RNMzJNUDEzeCkgKz0gc3RtMzJtcDEvCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0
bTMybXAvc29jLmMgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc29jLmMKPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi44ZDVmYTQ3NGNjYWYKPj4gLS0tIC9kZXYv
bnVsbAo+PiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc29jLmMKPj4gQEAgLTAsMCArMSwx
NyBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgT1Ig
QlNELTMtQ2xhdXNlCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDI0LCBTVE1pY3JvZWxl
Y3Ryb25pY3MgLSBBbGwgUmlnaHRzIFJlc2VydmVkCj4+ICsgKi8KPj4gKwo+PiArI2luY2x1ZGUg
PGFzbS9hcmNoL3N5c19wcm90by5oPgo+PiArCj4+ICsvKiB1c2VkIHdoZW4gQ09ORklHX0RJU1BM
QVlfQ1BVSU5GTyBpcyBhY3RpdmF0ZWQgKi8KPj4gK2ludCBwcmludF9jcHVpbmZvKHZvaWQpCj4+
ICt7Cj4+ICsgICAgICAgY2hhciBuYW1lW1NPQ19OQU1FX1NJWkVdOwo+PiArCj4+ICsgICAgICAg
Z2V0X3NvY19uYW1lKG5hbWUpOwo+PiArICAgICAgIHByaW50ZigiQ1BVOiAlc1xuIiwgbmFtZSk7
Cj4+ICsKPj4gKyAgICAgICByZXR1cm4gMDsKPj4gK30KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L21hY2gtc3RtMzJtcC9zdG0zMm1wMS9jcHUuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0z
Mm1wMS9jcHUuYwo+PiBpbmRleCA1NTU3NGZkNGJlYmYuLjAwZmVhNzkyOWIyZiAxMDA2NDQKPj4g
LS0tIGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL2NwdS5jCj4+ICsrKyBiL2FyY2gv
YXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9jcHUuYwo+PiBAQCAtMTU4LDE3ICsxNTgsNiBAQCB2
b2lkIGVuYWJsZV9jYWNoZXModm9pZCkKPj4gICAgICAgICBkY2FjaGVfZW5hYmxlKCk7Cj4+ICB9
Cj4+Cj4+IC0vKiB1c2VkIHdoZW4gQ09ORklHX0RJU1BMQVlfQ1BVSU5GTyBpcyBhY3RpdmF0ZWQg
Ki8KPj4gLWludCBwcmludF9jcHVpbmZvKHZvaWQpCj4+IC17Cj4+IC0gICAgICAgY2hhciBuYW1l
W1NPQ19OQU1FX1NJWkVdOwo+PiAtCj4+IC0gICAgICAgZ2V0X3NvY19uYW1lKG5hbWUpOwo+PiAt
ICAgICAgIHByaW50ZigiQ1BVOiAlc1xuIiwgbmFtZSk7Cj4+IC0KPj4gLSAgICAgICByZXR1cm4g
MDsKPj4gLX0KPj4gLQo+PiAgc3RhdGljIHZvaWQgc2V0dXBfYm9vdF9tb2RlKHZvaWQpCj4+ICB7
Cj4+ICAgICAgICAgY29uc3QgdTMyIHNlcmlhbF9hZGRyW10gPSB7Cj4+IGRpZmYgLS1naXQgYS9h
cmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvY3B1LmMgYi9hcmNoL2FybS9tYWNoLXN0bTMy
bXAvc3RtMzJtcDIvY3B1LmMKPj4gaW5kZXggZjQzZDFhYWY3MmNjLi5jMGY2NTE5ZThkN2MgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9jcHUuYwo+PiArKysg
Yi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvY3B1LmMKPj4gQEAgLTY3LDE3ICs2Nyw2
IEBAIHZvaWQgZW5hYmxlX2NhY2hlcyh2b2lkKQo+PiAgICAgICAgIGRjYWNoZV9lbmFibGUoKTsK
Pj4gIH0KPj4KPj4gLS8qIHVzZWQgd2hlbiBDT05GSUdfRElTUExBWV9DUFVJTkZPIGlzIGFjdGl2
YXRlZCAqLwo+PiAtaW50IHByaW50X2NwdWluZm8odm9pZCkKPj4gLXsKPj4gLSAgICAgICBjaGFy
IG5hbWVbU09DX05BTUVfU0laRV07Cj4+IC0KPj4gLSAgICAgICBnZXRfc29jX25hbWUobmFtZSk7
Cj4+IC0gICAgICAgcHJpbnRmKCJDUFU6ICVzXG4iLCBuYW1lKTsKPj4gLQo+PiAtICAgICAgIHJl
dHVybiAwOwo+PiAtfQo+PiAtCj4+ICBpbnQgYXJjaF9taXNjX2luaXQodm9pZCkKPj4gIHsKPj4g
ICAgICAgICByZXR1cm4gMDsKPj4gLS0KPj4gMi4yNS4xCj4+Cj4gCj4gUmV2aWV3ZWQtYnk6IEln
b3IgT3Bhbml1ayA8aWdvci5vcGFuaXVrQGZvdW5kcmllcy5pbz4KPiAKQXBwbGllZCB0byB1LWJv
b3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
