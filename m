Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C46D9E185F
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 10:56:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A40CC6C83D;
	Tue,  3 Dec 2024 09:56:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1515C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 09:56:10 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37eKpB030472;
 Tue, 3 Dec 2024 10:55:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Tkly+uWM/cB0p9NNjINh0RS+XlGUc7K5NKK4aZ90YtA=; b=mWR4DBtWlHebSMRF
 tviEse/ScKnnir2cf9MtCaJBW76EZRb81njVJrPBMHbuUdOINiZ0sDZwbIHyzH8H
 q/DkwcpqY7cCQz2S2Hu3CBTj6LeTAdLtSv3xsYHreZd65cafjWfdlncVZgrlPY26
 YjRwm5VzqbGDYz2D8IlGAy4o6a3+58eLt0G2uzzca+0JTJQXYJeHe5xtksNWC0JG
 7BXQMimQu4s4zJFxHOeCOi4HwkgaDxgyree1x4oQfVlUtMqdiMBwIIGLXIoY+dDN
 8hDQuSc4yDirSA/GzwRFlQI3bcOOfLOhgkgslTuhovZFLSiyj0QeoziIDKg4bGT1
 ePT+tg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 437s0kvpf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 10:55:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 86C2640068;
 Tue,  3 Dec 2024 10:54:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D4ED270F37;
 Tue,  3 Dec 2024 10:52:25 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 3 Dec
 2024 10:52:24 +0100
Message-ID: <44c5ddd6-e1c4-4140-8b44-458ccd298acd@foss.st.com>
Date: Tue, 3 Dec 2024 10:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>, <u-boot@lists.denx.de>
References: <20241129124422.435998-1-patrice.chotard@foss.st.com>
 <cc44ca41-07d7-4980-94c6-62bc95cc249b@cherry.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <cc44ca41-07d7-4980-94c6-62bc95cc249b@cherry.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jonas Karlman <jonas@kwiboo.se>, Simon Glass <sjg@chromium.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] power: regulator: replace some debug() by
	dev_dbg/err()
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

CgpPbiAxMi8yLzI0IDEwOjMyLCBRdWVudGluIFNjaHVseiB3cm90ZToKPiBIaSBQYXRyaWNlLAo+
IAo+IE9uIDExLzI5LzI0IDE6NDQgUE0sIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gUmVwbGFj
ZSBzb21lIGRlYnVnKCkgYnkgZGV2X2RiZygpIHdoZW4gZGV2IHZhcmlhYmxlCj4+IGlzIGF2YWls
YWJsZS92YWxpZC4KPj4KPj4gVG8gZWFzZSBkZWJ1Z2dpbmcsIHVzZSBkZXZfZXJyKCkgaW5zdGVh
ZCBvZiBkZXZfZGJnKCkgZm9yCj4+IGFsZXJ0aW5nIHdoZW4gcmVndWxhdG9yIGhhcyBub251bmlx
dWUgdmFsdWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgZHJpdmVycy9wb3dlci9yZWd1bGF0
b3IvcmVndWxhdG9yLXVjbGFzcy5jIHwgMTUgKysrKysrKystLS0tLS0tCj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3Bvd2VyL3JlZ3VsYXRvci9yZWd1bGF0b3ItdWNsYXNzLmMgYi9kcml2ZXJzL3Bv
d2VyL3JlZ3VsYXRvci9yZWd1bGF0b3ItdWNsYXNzLmMKPj4gaW5kZXggZGVjZDA4MDJjODQuLmFh
NjkxOGVmNTBhIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3Bvd2VyL3JlZ3VsYXRvci9yZWd1bGF0
b3ItdWNsYXNzLmMKPj4gKysrIGIvZHJpdmVycy9wb3dlci9yZWd1bGF0b3IvcmVndWxhdG9yLXVj
bGFzcy5jCj4+IEBAIC05LDYgKzksNyBAQAo+PiDCoCAjaW5jbHVkZSA8ZXJybm8uaD4KPj4gwqAg
I2luY2x1ZGUgPGRtLmg+Cj4+IMKgICNpbmNsdWRlIDxsb2cuaD4KPj4gKyNpbmNsdWRlIDxkbS9k
ZXZpY2VfY29tcGF0Lmg+Cj4+IMKgICNpbmNsdWRlIDxkbS91Y2xhc3MtaW50ZXJuYWwuaD4KPj4g
wqAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4+IMKgICNpbmNsdWRlIDxwb3dlci9wbWljLmg+
Cj4+IEBAIC00Myw4ICs0NCw4IEBAIHN0YXRpYyB2b2lkIHJlZ3VsYXRvcl9zZXRfdmFsdWVfcmFt
cF9kZWxheShzdHJ1Y3QgdWRldmljZSAqZGV2LCBpbnQgb2xkX3VWLAo+PiDCoCB7Cj4+IMKgwqDC
oMKgwqAgaW50IGRlbGF5ID0gRElWX1JPVU5EX1VQKGFicyhuZXdfdVYgLSBvbGRfdVYpLCByYW1w
X2RlbGF5KTsKPj4gwqAgLcKgwqDCoCBkZWJ1ZygicmVndWxhdG9yICVzOiBkZWxheSAldSB1cyAo
JWQgdVYgLT4gJWQgdVYpXG4iLCBkZXYtPm5hbWUsIGRlbGF5LAo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgIG9sZF91ViwgbmV3X3VWKTsKPj4gK8KgwqDCoCBkZXZfZGJnKGRldiwgInJlZ3VsYXRvciAl
czogZGVsYXkgJXUgdXMgKCVkIHVWIC0+ICVkIHVWKVxuIiwgZGV2LT5uYW1lLCBkZWxheSwKPj4g
K8KgwqDCoMKgwqDCoMKgIG9sZF91ViwgbmV3X3VWKTsKPiAKPiBJc24ndCBkZXZfZGJnIGFscmVh
ZHkgcHJpbnRpbmcgZGV2LT5uYW1lPwoKWW91IGFyZSByaWdodCwgaSB3aWxsIHJld3dvcmsgdGhp
cyBwYXJ0Cgo+IAo+PiDCoCDCoMKgwqDCoMKgIHVkZWxheShkZWxheSk7Cj4+IMKgIH0KPj4gQEAg
LTI2Myw3ICsyNjQsNyBAQCBpbnQgcmVndWxhdG9yX2dldF9ieV9wbGF0bmFtZShjb25zdCBjaGFy
ICpwbGF0X25hbWUsIHN0cnVjdCB1ZGV2aWNlICoqZGV2cCkKPj4gwqDCoMKgwqDCoCBmb3IgKHJl
dCA9IHVjbGFzc19maW5kX2ZpcnN0X2RldmljZShVQ0xBU1NfUkVHVUxBVE9SLCAmZGV2KTsgZGV2
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSB1Y2xhc3NfZmluZF9uZXh0X2RldmljZSgm
ZGV2KSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkgewo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkZWJ1ZygicmVndWxhdG9yICVzLCByZXQ9JWRcbiIsIGRldi0+bmFtZSwgcmV0
KTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2RiZyhkZXYsICJyZWd1bGF0b3IgJXMs
IHJldD0lZFxuIiwgZGV2LT5uYW1lLCByZXQpOwo+IAo+IERpdHRvLgoKb2sKPiAKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
IMKgIEBAIC00MzksMTYgKzQ0MCwxNiBAQCBzdGF0aWMgaW50IHJlZ3VsYXRvcl9wb3N0X2JpbmQo
c3RydWN0IHVkZXZpY2UgKmRldikKPj4gwqDCoMKgwqDCoCAvKiBSZWd1bGF0b3IncyBtYW5kYXRv
cnkgY29uc3RyYWludCAqLwo+PiDCoMKgwqDCoMKgIHVjX3BkYXRhLT5uYW1lID0gZGV2X3JlYWRf
c3RyaW5nKGRldiwgcHJvcGVydHkpOwo+PiDCoMKgwqDCoMKgIGlmICghdWNfcGRhdGEtPm5hbWUp
IHsKPj4gLcKgwqDCoMKgwqDCoMKgIGRlYnVnKCIlczogZGV2ICclcycgaGFzIG5vIHByb3BlcnR5
ICclcydcbiIsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2Z1bmNfXywgZGV2LT5u
YW1lLCBwcm9wZXJ0eSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZGJnKGRldiwgIiVzOiBkZXYg
JyVzJyBoYXMgbm8gcHJvcGVydHkgJyVzJ1xuIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
X19mdW5jX18sIGRldi0+bmFtZSwgcHJvcGVydHkpOwo+IAo+IEFzIHdlbGwuCgpvawo+IAo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgdWNfcGRhdGEtPm5hbWUgPSBkZXZfcmVhZF9uYW1lKGRldik7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXVjX3BkYXRhLT5uYW1lKQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIMKgwqDC
oMKgwqAgaWYgKCFyZWd1bGF0b3JfbmFtZV9pc191bmlxdWUoZGV2LCB1Y19wZGF0YS0+bmFtZSkp
IHsKPj4gLcKgwqDCoMKgwqDCoMKgIGRlYnVnKCInJXMnIG9mIGRldjogJyVzJywgaGFzIG5vbnVu
aXF1ZSB2YWx1ZTogJyVzXG4iLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJvcGVy
dHksIGRldi0+bmFtZSwgdWNfcGRhdGEtPm5hbWUpOwo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2Vy
cihkZXYsICInJXMnIG9mIGRldjogJyVzJywgaGFzIG5vbnVuaXF1ZSB2YWx1ZTogJyVzXG4iLAo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0eSwgZGV2LT5uYW1lLCB1Y19wZGF0YS0+
bmFtZSk7Cj4gCj4gU2ltaWxhcmx5Lgo+IAo+IFNvLCBkbyB3ZSBub3QgcHJpbnQgdGhlIHNhbWUg
aW5mbyB0d2ljZSBpbiB0aGUgbWVzc2FnZT8gSWYgc28sIHRoZW4gd2Ugc2hvdWxkIHJld29yayB0
aGUgZGVidWcgbWVzc2FnZSB0byByZW1vdmUgaXQuCj4gCj4gQWRkaXRpb25hbGx5LCBzcGxpdCBp
biB0d28gY29tbWl0cywgb25lIGZvciBtaWdyYXRpbiB0byBkZXZfZGJnIGFuZCBvbmUgZm9yIG1p
Z3JhdGluZyB0byBkZXZfZXJyIHNvIHdlIGNhbiByZXZlcnQgb25lIG9yIHRoZSBvdGhlciBhbmQg
dGhlIGNoYW5nZSBpcyBleHBsaWNpdC4gKEkndmUgZG9uZSBhIG1peGVkIGZpbmQtcmVwbGFjZSBh
IGZldyByZWxlYXNlcyBhZ28gdGhhdCBtYWRlIHNvbWUgcGVvcGxlIHVuaGFwcHkgYW5kIGl0IHdv
dWxkIGhhdmUgYmVlbiBlYXNpZXIgdG8gcmV2ZXJ0IGp1c3QgdGhlIGNvbW1pdCB0aGF0IHdhcyBw
cm9ibGVtYXRpYyB0aGFuIHBhdGNoaW5nIHRoaW5ncyB1cCBtYW51YWxseSA6KSApLgoKT2sgaSB3
aWxsIHNwbGl0IGl0IGludG8gMiBkaWZmZXJlbnQgcGF0Y2hzCgpUaGFua3MKCj4gCj4gVGhlIGNo
YW5nZSBpdHNlbGYgaXMgZmluZSBvdGhlcndpc2UsIHNvCj4gCj4gUmV2aWV3ZWQtYnk6IFF1ZW50
aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBjaGVycnkuZGU+Cj4gCj4gVGhhbmtzIQo+IFF1ZW50
aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
