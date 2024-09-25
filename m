Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE37D9865F9
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Sep 2024 19:51:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F627C78006;
	Wed, 25 Sep 2024 17:51:34 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CFFFC57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 17:51:33 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PD7IHr024311;
 Wed, 25 Sep 2024 19:51:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 spnCYLkjsjfThrKxPJxIii1OJ0bw+46AzhfRavjaPXg=; b=2O9FiiDu30D9XwQr
 88T+2VmmuHL+1PP3UJBvAgSF7cYLJ/3q1RMmTcCdhz6G727B855PyltK8vERLzKi
 i8HuTTr6Vqd419EDH7UMBZQA6GgslxiuODmKAv6C08tlLSKPVvG+DVKI9VguDXeB
 oHjiN4y9WZ4u/bTqraw0CZffhxLQCvLHW7xJ6tTTVhNp6PYc05ie+PzKgEkPh1Pf
 ZBP9dPfN2PF5PNk2gztsauu0KEwy4lp4s8Y82cMK9Cul84haumGqnJAPb7Fc+ASv
 3klom9NoVDBjLrOyTWUKnewpUfcKPeqAz+heimTcBTu6veGbTEWgUH32IUTctEcM
 OMxq4g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41t93jjpak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 19:51:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 159EE4006E;
 Wed, 25 Sep 2024 19:50:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD8E227B40D;
 Wed, 25 Sep 2024 19:50:21 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 25 Sep
 2024 19:50:21 +0200
Message-ID: <6702ce8b-e4ff-45e2-a021-dd0a0d1253db@foss.st.com>
Date: Wed, 25 Sep 2024 19:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, Patrice CHOTARD
 <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>, Tom Rini
 <trini@konsulko.com>
References: <20240618225736.154959-1-marex@denx.de>
 <2fd69224-c299-4b43-9078-07e06cc345f5@foss.st.com>
 <6957bfce-21c5-4996-9e3f-a43f6243fa49@denx.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <6957bfce-21c5-4996-9e3f-a43f6243fa49@denx.de>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Fix TAMP_SMCR BKP..PROT
	fields on STM32MP15xx
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

SGkgTWFyZWssCgpPbiA5LzI1LzI0IDE5OjA0LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzE5
LzI0IDg6MzUgQU0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPj4KPj4KPj4gT24gNi8xOS8yNCAw
MDo1NywgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBVcGRhdGUgdGhlIFRBTVBfU01DUiBCS1AuLlBS
T1QgZmllbGRzIHRvIHB1dCBmaXJzdCAxMCByZWdpc3RlcnMKPj4+IGludG8gcHJvdGVjdGlvbiB6
b25lIDEgYW5kIG5leHQgNSBpbnRvIHpvbmUgMi4gVGhpcyBmaXhlcyB1c2Ugb2YKPj4+IGJvb3Qg
Y291bnRlciB3aGljaCBpcyBvZnRlbiBpbiB6b25lIDMgYW5kIGhhcyB0byBiZSB1cGRhdGVkIGZy
b20KPj4+IExpbnV4LCB3aGljaCBydW5zIGluIE5TLgo+Pj4KPj4+IEZpeGVzOiA3M2Y3ZmM5NDRj
ZjYgKCJBUk06IHN0bTMyOiBJbml0aWFsaXplIFRBTVBfU01DUiBCS1AuLlBST1QgCj4+PiBmaWVs
ZHMgb24gU1RNMzJNUDE1eHgiKQo+Pj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4
QGRlbnguZGU+Cj4+PiAtLS0KPj4+IENjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFy
ZEBmb3NzLnN0LmNvbT4KPj4+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5
QGZvc3Muc3QuY29tPgo+Pj4gQ2M6IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+Cj4+PiBD
YzogdS1ib290QGxpc3RzLmRlbnguZGUKPj4+IENjOiB1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCj4+PiAtLS0KPj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0z
Mm1wMS9zdG0zMm1wMTV4LmMgfCA0ICsrLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21h
Y2gtc3RtMzJtcC9zdG0zMm1wMS9zdG0zMm1wMTV4LmMgCj4+PiBiL2FyY2gvYXJtL21hY2gtc3Rt
MzJtcC9zdG0zMm1wMS9zdG0zMm1wMTV4LmMKPj4+IGluZGV4IGYwOTZmZTUzOGQ4Li5jYTIwMmJl
YzhlZSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9zdG0z
Mm1wMTV4LmMKPj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9zdG0zMm1w
MTV4LmMKPj4+IEBAIC0xNDgsOCArMTQ4LDggQEAgc3RhdGljIHZvaWQgc2VjdXJpdHlfaW5pdCh2
b2lkKQo+Pj4gwqDCoMKgwqDCoMKgICovCj4+PiDCoMKgwqDCoMKgIGNscnNldGJpdHNfbGUzMihU
QU1QX1NNQ1IsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUQU1QX1NNQ1JfQktQUldE
UFJPVCB8IFRBTVBfU01DUl9CS1BXRFBST1QsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBG
SUVMRF9QUkVQKFRBTVBfU01DUl9CS1BSV0RQUk9ULCAweDIwKSB8Cj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBGSUVMRF9QUkVQKFRBTVBfU01DUl9CS1BXRFBST1QsIDB4MjApKTsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEZJRUxEX1BSRVAoVEFNUF9TTUNSX0JLUFJXRFBST1QsIDB4
MEEpIHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEZJRUxEX1BSRVAoVEFNUF9TTUNSX0JL
UFdEUFJPVCwgMHgwRikpOwo+Pj4gwqAgwqDCoMKgwqDCoCAvKiBHUElPWjogZGVhY3RpdmF0ZSB0
aGUgc2VjdXJpdHkgKi8KPj4+IMKgwqDCoMKgwqAgd3JpdGVsKEJJVCgwKSwgUkNDX01QX0FIQjVF
TlNFVFIpOwo+Pgo+PiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAZm9zcy5zdC5jb20+Cj4KPiBJIGhvcGUgdGhpcyBidWdmaXggd2lsbCBtYWtlIGl0IGludG8g
MjAyNC4xMCAsIGNhbiB5b3UgcHJlcGFyZSBhIAo+IGJ1Z2ZpeCBQUiBmb3IgMjAyNC4xMCA/CgoK
VGhhbmtzIGZvciByZW1pbmRlciwgSSBtaXNzIGl0LgoKQW5kIHNvcnJ5IGZvciB0aGUgZGVsYXks
IGJlY2F1c2UgYSBwdWxsIHJlcXVlc3Qgd2FzIHBsYW5uZWQgYnkgUGF0cmljZSAKYWZ0ZXIgd2l0
aCBzdW1tZXIgaG9saWRheS4uLi4KYnV0IHVuZm9ydHVuYXRlbHkgaXQgY2FuJ3QgZG8gaXQgbm93
IChoZSBpcyBvdXQgb2YgdGhlIG9mZmljZSBmb3IgYSBmZXcgCndlZWtzIGFmdGVyIGEgc21hbGwg
aW5jaWRlbnQpCgpzbyBJIHdpbGwgcHVzaCBhIFBSIHRoaXMgd2VlayB3aXRoIHlvdXIgMiBidWdm
aXggcGF0Y2hlcy4KCgpSZWdhcmRzCgpQYXRyaWNrCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
