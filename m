Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E8A23A59
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 08:59:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE674C78012;
	Fri, 31 Jan 2025 07:59:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96AB3C71292
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 07:59:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V7pCuk006643;
 Fri, 31 Jan 2025 08:59:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 jmHqe/u/fURXqvPgUarxrI6iVLGQh5qQO1RK31RQ/gs=; b=T1kU3bjOaRCcTa7t
 pWh7pmYEocGtewKsG3Rs882hLstOSMi1DtyQ53VyF/1A3B5HeTExZaJNYCU46rP5
 kcpYHZZqWDnQfRy0h5bmB/J2xbXI3cwqRWgPLb0F3aZ6s72alNPdcgdTHsexhtVb
 06GjnIS6h9YJEuEtJdB4O6F+D0bewnZW5qMSPE4JIuZvv5nJeF3HEYh2vLvOQ9zt
 mlX2xzSy5gBE8JjkGLdykx+vfms5cuJdAK9GA6f1gy2WQj0Xw+VmTqLkaJQpfBNc
 AxPf+6LOSdvELMoCFPSy0bI5uiUhbn/wqgQqx5wC9bcxAhEUtKXu6n5OA3SPGIxt
 TrmaKQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7ghss6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 08:59:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 17F6A40053;
 Fri, 31 Jan 2025 08:58:44 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BADC4272A13;
 Fri, 31 Jan 2025 08:56:31 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 08:56:31 +0100
Message-ID: <9ca8b081-81d6-4f4f-b525-8b0cfb2e8502@foss.st.com>
Date: Fri, 31 Jan 2025 08:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
 <20241129122711.411917-2-patrice.chotard@foss.st.com>
 <ae469951-f6f2-4be8-99d5-38db13ed85bc@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ae469951-f6f2-4be8-99d5-38db13ed85bc@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/6] fastboot: Fix warning when
 CONFIG_SYS_64BIT_LBA is enable
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

CgpPbiAxLzgvMjUgMTk6NDgsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MTEvMjkvMjQgMTM6MjcsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gSWYgQ09ORklHX1NZU182
NEJJVF9MQkEgaXMgZW5hYmxlLCBmb2xsb3dpbmcgY29tcGlsYXRpb24gd2FybmluZyBpcwo+PiB0
cmlnZ2VyZWQ6Cj4+Cj4+IMKgIENDwqDCoMKgwqDCoCBkcml2ZXJzL2Zhc3Rib290L2ZiX21tYy5v
Cj4+IC4uL2RyaXZlcnMvZmFzdGJvb3QvZmJfbW1jLmM6IEluIGZ1bmN0aW9uICdmYl9tbWNfZXJh
c2VfbW1jX2h3cGFydCc6Cj4+IC4uL2RyaXZlcnMvZmFzdGJvb3QvZmJfbW1jLmM6MjE1OjM1OiB3
YXJuaW5nOiBmb3JtYXQgJyVsdScgZXhwZWN0cwo+PiBhcmd1bWVudCBvZiB0eXBlICdsb25nIHVu
c2lnbmVkIGludCcsIGJ1dCBhcmd1bWVudCAyIGhhcyB0eXBlCj4+ICdsb25nIGxvbmcgdW5zaWdu
ZWQgaW50JyBbLVdmb3JtYXQ9XQo+PiDCoMKgIDIxNSB8wqDCoMKgwqDCoMKgwqDCoCBwcmludGYo
Ii4uLi4uLi4uIGVyYXNlZCAlbHUgYnl0ZXMgZnJvbSBtbWMgaHdwYXJ0WyV1XVxuIiwKPj4gwqDC
oMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH5+Xgo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPj4g
wqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb25nIHVuc2lnbmVkIGludAo+PiDCoMKgwqDCoMKg
wqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJWxsdQo+PiDCoMKgIDIxNiB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGRldl9kZXNjLT5sYmEgKiBkZXZfZGVzYy0+Ymxrc3osIGRldl9kZXNjLT5od3BhcnQpOwo+
PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+IMKgwqDCoMKgwqDC
oCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBsb25nIGxvbmcgdW5zaWduZWQgaW50Cj4+IC4uL2RyaXZlcnMvZmFzdGJvb3QvZmJfbW1j
LmM6IEluIGZ1bmN0aW9uICdmYl9tbWNfYm9vdF9vcHMnOgo+PiAuLi9kcml2ZXJzL2Zhc3Rib290
L2ZiX21tYy5jOjI2MTo0Mjogd2FybmluZzogZm9ybWF0ICclbHUnIGV4cGVjdHMKPj4gYXJndW1l
bnQgb2YgdHlwZSAnbG9uZyB1bnNpZ25lZCBpbnQnLCBidXQgYXJndW1lbnQgMiBoYXMgdHlwZQo+
PiAnbG9uZyBsb25nIHVuc2lnbmVkIGludCcgWy1XZm9ybWF0PV0KPj4gwqDCoCAyNjEgfMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByaW50ZigiLi4uLi4uLi4gd3JvdGUgJWx1IGJ5
dGVzIHRvIEVNTUNfQk9PVCVkXG4iLAo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB+fl4KPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPj4g
wqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvbmcgdW5zaWduZWQgaW50
Cj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICVsbHUKPj4gwqDCoCAyNjIg
fMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxrY250ICog
Ymxrc3osIGh3cGFydCk7Cj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB+fn5+fn5+fn5+fn5+fgo+PiDCoMKgwqDCoMKgwqAgfMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8Cj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQKPj4KPj4gU2ln
bmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+
Cj4+IC0tLQo+Pgo+PiDCoCBkcml2ZXJzL2Zhc3Rib290L2ZiX21tYy5jIHwgOCArKysrLS0tLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+
IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZv
c3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3Rt
MzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
