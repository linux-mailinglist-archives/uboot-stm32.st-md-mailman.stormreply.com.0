Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F58815B3
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Mar 2024 17:33:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD932C6DD60;
	Wed, 20 Mar 2024 16:33:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 331BFC6B46B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Mar 2024 16:33:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42KC11kp010576; Wed, 20 Mar 2024 17:33:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Od8oFifrnhejK5VS1xIeabyS/8N/WbflqddAmmV3xdM=; b=s5
 8fGwqbKz1IaLeHKXFw+9LYB7rxT1nppFpuIGpiWf/pA4velMzpvXIpbrEaaIYaM2
 RFvgEaCbO4Sr8gThSKbOxyqKSGKDHQTVPw/FOvkpd5Yn4DNgIQFs/DJIPdXrfXMV
 YfEC+M5ErT268XKXvHIgL8hhxVdPnPi/WKMz2XcoMjqhjUpuOgwdKUoC39Hyjwzd
 Yk/Q+fDKOT5vv+OnRzLTN+Ja2LPersxNmiFmfDUIv/x4WOwmIBGlY4dfXZlK+DeW
 N56+FckRn/KFZEjOxMrsIvAR64p55Ttg9vAE1VPaRBXGdmLzuM+Se95eLmIetwmk
 P4x7Vft/LL8jWsxT+Grg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ww36htdgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Mar 2024 17:33:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C31FE40048;
 Wed, 20 Mar 2024 17:33:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EA3326BB43;
 Wed, 20 Mar 2024 17:32:44 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Mar
 2024 17:32:43 +0100
Message-ID: <597273b3-8a68-43fb-ae2d-3dd889334e55@foss.st.com>
Date: Wed, 20 Mar 2024 17:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20240320113051.1.If084ef69b9da34900391d0f0acc13475b250ce9f@changeid>
 <CAC_iWj+1j+WR0aCTLA9Z21j347FpT95t3iWZnJoPFhH5E9jScQ@mail.gmail.com>
 <84a8915f-ec97-4a1a-9acb-edae56ae5c97@gmx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <84a8915f-ec97-4a1a-9acb-edae56ae5c97@gmx.de>
X-Originating-IP: [10.201.20.71]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_10,2024-03-18_03,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: Add absolute path to
	EFI_VAR_FILE_NAME
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

CgpPbiAzLzIwLzI0IDE0OjA1LCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+IE9uIDIwLjAz
LjI0IDEyOjUzLCBJbGlhcyBBcGFsb2RpbWFzIHdyb3RlOgo+PiBIaSBQYXRyaWNlLAo+Pgo+PiBP
biBXZWQsIDIwIE1hciAyMDI0IGF0IDEyOjMxLCBQYXRyaWNlIENob3RhcmQKPj4gPHBhdHJpY2Uu
Y2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gSWYgdGhlIEVTUCBwYXJ0aXRpb24g
aXMgZm9ybWF0dGVkIGluIGV4dDQsIHdlIGdvdCB0aGUgZm9sbG93aW5nIGVycm9yIDoKPj4+Cj4+
PiBTVE0zMk1QPsKgIHNldGVudiAtZSAtbnYgLWJzIC1ydCAtdiBPc0luZGljYXRpb25zID0weDAw
MDAwMDAwMDAwMDAwMDQKPj4+IEdVSUQ6IDhiZTRkZjYxLTkzY2EtMTFkMi1hYTBkLTAwZTA5ODAz
MmI4YyAoRUZJX0dMT0JBTF9WQVJJQUJMRV9HVUlEKQo+Pj4gQXR0cmlidXRlczogMHg3Cj4+PiBW
YWx1ZToKPj4+IMKgwqDCoMKgIDAwMDAwMDAwOiAwNCAwMCAwMCAwMCAwMCAwMCAwMCAwMMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uLi4uLi4uCj4+
PiBGaWxlIFN5c3RlbSBpcyBjb25zaXN0ZW50Cj4+PiBQbGVhc2Ugc3VwcGx5IEFic29sdXRlIHBh
dGgKPj4KPj4gVGhpcyBlcnJvciBtZXNzYWdlIGNvbWVzIGZyb20gZXh0NF9jb21tb24uYyBhbmQg
aXQncyBleHQ0IHNwZWNpZmljLiBEbwo+PiB5b3UgaGF2ZSBhbnkgaWRlYSB3aHkgdGhpcyBleGlz
dHM/Cj4+IFdoYXQgaGFwcGVucyB0byBvdGhlciBmaWxlc3lzdGVtcz8gSU9XIGRvZXMgdGhpcyBj
aGFuZ2UgdGhlIGJlaGF2aW9yCj4+IG9mIHRoZSBleGlzdGluZyBjb2RlIGlmIGl0IHRyaWVzIHRv
IHdyaXRlIGEgZmlsZSBpbiBGQVQ/Cj4gCj4gV2hlbiByZWFkaW5nIGEgZmlsZSB3aXRoIHRoZSBl
eHQ0IGRyaXZlciBsZWFkaW5nICcvJyBhcmUgaWdub3JlZCBieQo+IHJlbW92aW5nIHRoZW0gaW4g
ZXh0NGZzX2ZpbmRfZmlsZTEoKS4gSXQgaXMgcmVhbGx5IGluY29uc2lzdGVudCB0aGF0Cj4gd2hl
biB3cml0aW5nIGEgbGVhZGluZyAnLycgaXMgcmVxdWlyZWQuCj4gCj4gV2UgY2FuIHNpbXBseSBy
ZW1vdmUgdGhlIGNoZWNrIGluIGV4dDRmc19nZXRfcGFyZW50X2lub2RlX251bSgpLiBJIGZvdW5k
Cj4gbm8gaXNzdWVzIHdoZW4gc2F2aW5nIHRvIGFuIGV4dDQgZmlsZSBzeXN0ZW0gd2l0aCB0aGUg
Y2hlY2sgcmVtb3ZlZC4KPiAKPiBJIHdpbGwgc2VuZCBhIHBhdGNoLgoKT2sgdGhhbmtzIDstKQoK
PiAKPiBCZXN0IHJlZ2FyZHMKPiAKPiBIZWlucmljaAo+IAo+Pgo+PiBUaGFua3MKPj4gL0lsaWFz
Cj4+Cj4+PiAqKiBFcnJvciBleHQ0ZnNfd3JpdGUoKSAqKgo+Pj4gKiogVW5hYmxlIHRvIHdyaXRl
IGZpbGUgdWJvb3RlZmkudmFyICoqCj4+PiBGYWlsZWQgdG8gcGVyc2lzdCBFRkkgdmFyaWFibGVz
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRA
Zm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+Cj4+PiDCoCBpbmNsdWRlL2VmaV92YXJpYWJsZS5oIHwg
MiArLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZWZpX3ZhcmlhYmxlLmggYi9pbmNsdWRlL2Vm
aV92YXJpYWJsZS5oCj4+PiBpbmRleCA4MDVlNmM1ZjFlMC4uOGQ1MDc0NjBiMjAgMTAwNjQ0Cj4+
PiAtLS0gYS9pbmNsdWRlL2VmaV92YXJpYWJsZS5oCj4+PiArKysgYi9pbmNsdWRlL2VmaV92YXJp
YWJsZS5oCj4+PiBAQCAtOTIsNyArOTIsNyBAQCBlZmlfc3RhdHVzX3QgZWZpX3F1ZXJ5X3Zhcmlh
YmxlX2luZm9faW50KHUzMiBhdHRyaWJ1dGVzLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1NjQgKnJlbWFpbmluZ192YXJpYWJsZV9zdG9yYWdlX3NpemUsCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHU2NCAqbWF4aW11bV92YXJpYWJsZV9zaXplKTsKPj4+Cj4+PiAtI2RlZmlu
ZSBFRklfVkFSX0ZJTEVfTkFNRSAidWJvb3RlZmkudmFyIgo+Pj4gKyNkZWZpbmUgRUZJX1ZBUl9G
SUxFX05BTUUgIi91Ym9vdGVmaS52YXIiCj4+Pgo+Pj4gwqAgI2RlZmluZSBFRklfVkFSX0JVRl9T
SVpFIENPTkZJR19FRklfVkFSX0JVRl9TSVpFCj4+Pgo+Pj4gLS0gCj4+PiAyLjI1LjEKPj4+Cj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0
bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vi
b290LXN0bTMyCg==
