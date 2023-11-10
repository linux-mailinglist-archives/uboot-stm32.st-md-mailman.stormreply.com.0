Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 873E47E7C82
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 14:23:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AF81C6B47D;
	Fri, 10 Nov 2023 13:23:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8200C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 13:23:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AAATYm1010084; Fri, 10 Nov 2023 14:23:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=nw0OlxDa2qnO80PyEViRCIxmx0H7DDSbHJCfaKtxZOA=; b=sM
 ZLivPo6tO8zFgsxih3ed3yHmdh7s8hLSyOWdkph97CNHued+EiQjQ8AzUFaSGrIn
 qKiDqrXDyWqV393ZKoWw0fLcybyM+Ylz105djVmZw/L4zmxBmxNL9mOFwkSFqxjm
 3YxKnD5BjJ0kF6R9trM71izNkHIKEBfpiukrZPRapb1CYQkes1OocvBh/SFp8coj
 Gf+oSHI32T0rwwCpjkYYHU15YzJBVwh0QtOB6Njldg1u7f/WMwn3WLvYLiJaU05a
 TNCE9FfGqLielr4PpIKPin12onJ7faXSQlY7F2M64nZhURZsWUVX0i1vFbPYvHJb
 qD7RwpPDDS5PmNTwLV2w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u7w26pdrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 14:23:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9163410005E;
 Fri, 10 Nov 2023 14:23:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8567A25E520;
 Fri, 10 Nov 2023 14:23:40 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 14:23:39 +0100
Message-ID: <58ba1108-12f4-4508-9032-31c832050315@foss.st.com>
Date: Fri, 10 Nov 2023 14:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-10-patrice.chotard@foss.st.com>
 <410e8a06-22e5-4105-b56b-079ffbe92c9e@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <410e8a06-22e5-4105-b56b-079ffbe92c9e@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_10,2023-11-09_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Bharat Gooty <bharat.gooty@broadcom.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Johan Jonker <jbx6244@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v1 9/9] stm32mp2: initial support
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

CgpPbiAxMS85LzIzIDEwOjQxLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEwLzI3LzIzIDE2OjQzLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEFkZCBpbml0aWFsIHN1
cHBvcnQgZm9yIFNUTTMyTVAyIFNvQ3MgZmFtaWx5Lgo+Pgo+PiBTb0NzIGluZm9ybWF0aW9uIGFy
ZSBhdmFpbGFibGUgaGVyZSA6Cj4+IGh0dHBzOi8vd3d3LnN0LmNvbS9jb250ZW50L3N0X2NvbS9l
bi9jYW1wYWlnbnMvbWljcm9wcm9jZXNzb3Itc3RtMzJtcDIuaHRtbAo+Pgo+PiBNaWdyYXRlIGFs
bCBNUDEgcmVsYXRlZCBjb2RlIGludG8gc3RtMzJtcDEvIGRpcmVjdG9yeQo+IAo+IE1pbm9yOgo+
IAo+IE1QMSA9PiBTVE0zMk1QMSBzZXJpZXMKPiAKPj4gQ3JlYXRlIHN0bTMybXAyIGRpcmVjdG9y
eSBkZWRpY2F0ZWQgZm9yIFNUTTMyTVAyIFNvQ3MuCj4+Cj4+IENvbW1vbiBjb2RlIHRvIE1QMSwg
TVAxMyBhbmQgTVAyNSBpcyBrZXB0IGludG8KPiAKPiAKPiBNaW5vcgo+IAo+IE1QMSA9PiBTVE0z
Mk1QMTUKPiAKPiBNUDEzID0+IFNUTTMyTVAxMwo+IAo+IE1QMjUgPT4gU1RNMzJNUDI1Cj4gCj4g
Cj4+IGFyY2gvYXJtL21hY2gtc3RtMzIvbWFjaC1zdG0zMm1wIGRpcmVjdG9yeSA6Cj4+IMKgwqAg
LSBib290X3BhcmFtcy5jCj4+IMKgwqAgLSBic2VjCj4+IMKgwqAgLSBjbWRfc3RtMzJrZXkKPj4g
wqDCoCAtIGNtZF9zdG0zMnByb2cKPj4gwqDCoCAtIGRyYW1faW5pdC5jCj4+IMKgwqAgLSBzeXNj
b24uYwo+PiDCoMKgIC0gZWNkc2Ffcm9tYXBpLmMKPj4KPj4gRm9yIFNUTTMyTVAyLCBpdCBhbHNv
IDoKPj4gwqDCoCAtIGFkZHMgbWVtb3J5IHJlZ2lvbiBkZXNjcmlwdGlvbiBuZWVkZWQgZm9yIEFS
TXY4IE1NVS4KPj4gwqDCoCAtIGVuYWJsZXMgZWFybHkgZGF0YSBjYWNoZSBiZWZvcmUgcmVsb2Nh
dGlvbi4KPj4gwqDCoMKgwqAgRHVyaW5nIHRoZSB0cmFuc2l0aW9uIGJlZm9yZS9hZnRlciByZWxv
Y2F0aW9uLCB0aGUgTU1VLCBpbml0aWFsbHkgc2V0dXAKPj4gwqDCoMKgwqAgYXQgdGhlIGJlZ2lu
bmluZyBvZiBERFIsIG11c3QgYmUgc2V0dXAgYWdhaW4gYXQgYSBjb3JyZWN0IGFkZHJlc3MgYWZ0
ZXIKPj4gwqDCoMKgwqAgcmVsb2NhdGlvbi4gVGhpcyBpcyBkb25lIGluIGVuYWJsZXNfY2FjaGVz
KCkgYnkgZGlzYWJsaW5nIGNhY2hlLCBmb3JjZQo+PiDCoMKgwqDCoCBhcmNoLnRsYl9maWxscHRy
IHRvIE5VTEwgd2hpY2ggd2lsbCBmb3JjZSB0aGUgTU1VIHRvIGJlIHNldHVwIGFnYWluIGJ1dAo+
PiDCoMKgwqDCoCB3aXRoIGEgbmV3IHZhbHVlIGZvciBnZC0+YXJjaC50bGJfYWRkci4gZ2QtPmFy
Y2gudGxiX2FkZHIgaGFzIGJlZW4KPj4gwqDCoMKgwqAgdXBkYXRlZCBhZnRlciByZWxvY2F0aW9u
IGluIGFybV9yZXNlcnZlX21tdSgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3Rh
cmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGFyY2gvYXJt
L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgIDIgKy0KPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tjb25maWfC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjYgKystCj4+IMKgIGFyY2gvYXJt
L21hY2gtc3RtMzJtcC9LY29uZmlnLjI1eMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNDMg
KysrKwo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDE1ICstCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNs
dWRlL21hY2gvc3RtMzIuaMKgwqDCoCB8IDE0MSArKysrKysrKy0tLS0tCj4+IMKgIC4uLi9hcm0v
bWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFjaC9zeXNfcHJvdG8uaCB8wqAgMjYgKysrCj4+IMKgIGFy
Y2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9NYWtlZmlsZcKgwqDCoMKgwqDCoCB8wqAgMjAg
KysKPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3sgPT4gc3RtMzJtcDF9L2NwdS5jwqDCoMKg
IHzCoMKgIDAKPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3sgPT4gc3RtMzJtcDF9L2ZkdC5j
wqDCoMKgIHzCoMKgIDAKPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3sgPT4gc3RtMzJtcDF9
L3BzY2kuY8KgwqAgfMKgwqAgMAo+PiDCoCAuLi4veyA9PiBzdG0zMm1wMX0vcHdyX3JlZ3VsYXRv
ci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAwCj4+IMKgIGFyY2gvYXJtL21hY2gtc3Rt
MzJtcC97ID0+IHN0bTMybXAxfS9zcGwuY8KgwqDCoCB8wqDCoCAwCj4+IMKgIC4uLi9tYWNoLXN0
bTMybXAveyA9PiBzdG0zMm1wMX0vc3RtMzJtcDEzeC5jwqAgfMKgwqAgMAo+PiDCoCAuLi4vbWFj
aC1zdG0zMm1wL3sgPT4gc3RtMzJtcDF9L3N0bTMybXAxNXguY8KgIHzCoMKgIDAKPj4gwqAgYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL3sgPT4gc3RtMzJtcDF9L3R6YzQwMC5jIHzCoMKgIDAKPj4gwqAg
YXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL01ha2VmaWxlwqDCoMKgwqDCoMKgIHzCoMKg
IDkgKwo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvYXJtNjQtbW11LmPCoMKg
wqAgfMKgIDY4ICsrKysrKwo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvY3B1
LmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMDggKysrKysrKysrKwo+PiDCoCBhcmNoL2FybS9tYWNo
LXN0bTMybXAvc3RtMzJtcDIvZmR0LmPCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDE2ICsrCj4+IMKg
IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9zdG0zMm1wMjV4LmPCoMKgIHwgMTk0ICsr
KysrKysrKysrKysrKysrKwo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3lzY29uLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNCArLQo+PiDCoCBib2FyZC9zdC9zdG0z
Mm1wMi9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MTMgKysKPj4gwqAgYm9hcmQvc3Qvc3RtMzJtcDIvTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA5ICsKPj4gwqAgYm9hcmQvc3Qvc3RtMzJtcDIvTWFrZWZp
bGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2ICsKPj4gwqAg
Ym9hcmQvc3Qvc3RtMzJtcDIvc3RtMzJtcDIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDUyICsrKysrCj4+IMKgIGNvbmZpZ3Mvc3RtMzJtcDI1X2RlZmNvbmZpZ8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTIgKysrKysKPj4gwqAgaW5jbHVk
ZS9jb25maWdzL3N0bTMybXAyNV9jb21tb24uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDI0
ICsrKwo+PiDCoCAyNyBmaWxlcyBjaGFuZ2VkLCA3NTcgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRp
b25zKC0pCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9tYWNoLXN0bTMybXAvS2Nv
bmZpZy4yNXgKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9z
dG0zMm1wMS9NYWtlZmlsZQo+PiDCoCByZW5hbWUgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3sgPT4g
c3RtMzJtcDF9L2NwdS5jICgxMDAlKQo+PiDCoCByZW5hbWUgYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L3sgPT4gc3RtMzJtcDF9L2ZkdC5jICgxMDAlKQo+PiDCoCByZW5hbWUgYXJjaC9hcm0vbWFjaC1z
dG0zMm1wL3sgPT4gc3RtMzJtcDF9L3BzY2kuYyAoMTAwJSkKPj4gwqAgcmVuYW1lIGFyY2gvYXJt
L21hY2gtc3RtMzJtcC97ID0+IHN0bTMybXAxfS9wd3JfcmVndWxhdG9yLmMgKDEwMCUpCj4+IMKg
IHJlbmFtZSBhcmNoL2FybS9tYWNoLXN0bTMybXAveyA9PiBzdG0zMm1wMX0vc3BsLmMgKDEwMCUp
Cj4+IMKgIHJlbmFtZSBhcmNoL2FybS9tYWNoLXN0bTMybXAveyA9PiBzdG0zMm1wMX0vc3RtMzJt
cDEzeC5jICgxMDAlKQo+PiDCoCByZW5hbWUgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3sgPT4gc3Rt
MzJtcDF9L3N0bTMybXAxNXguYyAoMTAwJSkKPj4gwqAgcmVuYW1lIGFyY2gvYXJtL21hY2gtc3Rt
MzJtcC97ID0+IHN0bTMybXAxfS90emM0MDAuYyAoMTAwJSkKPj4gwqAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9NYWtlZmlsZQo+PiDCoCBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL2FybTY0LW1tdS5jCj4+
IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvY3B1
LmMKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1w
Mi9mZHQuYwo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0
bTMybXAyL3N0bTMybXAyNXguYwo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvc3Qvc3Rt
MzJtcDIvS2NvbmZpZwo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvc3Qvc3RtMzJtcDIv
TUFJTlRBSU5FUlMKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3N0L3N0bTMybXAyL01h
a2VmaWxlCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9zdC9zdG0zMm1wMi9zdG0zMm1w
Mi5jCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL3N0bTMybXAyNV9kZWZjb25maWcK
Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvY29uZmlncy9zdG0zMm1wMjVfY29tbW9u
LmgKPj4KPiAKPiB3aXRoIHRoZSBtaW5vciByZW1hcmsgb24gY29tbWl0IG1lc3NhZ2UKPiAKPiAK
PiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0
LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMy
L25leHQKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
