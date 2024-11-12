Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCB89C5A18
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2024 15:19:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2717C78F84;
	Tue, 12 Nov 2024 14:19:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46C92C78F84
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 14:19:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACABFMG022508;
 Tue, 12 Nov 2024 15:19:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WQT7r2AsxpKkbZturdV3gKaUyT1pLl6MlrTsXaDlOhU=; b=Itrzvu2PfL26qxeA
 7h7rilRDK4w66ACYZxp0Y0HVvndHTIiJhYDMTUTjHbWTyqIfRrq+UUujTAuMIiUm
 cEH+IwWFJNvxRPr/COEyfREd/OhSXTUCUaWK22eR185s9O8wNzcdr5uj/EXe+8gj
 k6GfUl23OeXGMzGj2TA6TMvClALG3cxLWBgoFtoeP+1a8oFCgmAdfJU9UnzAoeg9
 lf+5hv5BfhMQXTvnD11wE4p+touu02vG1EdsfVFDfdfdgkkOMS+n1M/f2fV1I8vK
 UDzVMgWQ94cYfvtIaAJpa/AlBvrGAEJcDfngqzsoBccN/HdVZXt59962e21pfpdQ
 5j/jOA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42swr8vrmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 15:19:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A8DF040066;
 Tue, 12 Nov 2024 15:17:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B6CD2A5D45;
 Tue, 12 Nov 2024 15:15:26 +0100 (CET)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 15:15:25 +0100
Message-ID: <2f7509b4-749d-4f94-aff7-c064d37066e9@foss.st.com>
Date: Tue, 12 Nov 2024 15:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241021194451.202977-1-marex@denx.de>
 <35e93102-c4d9-425b-84a5-23d42c5cf73e@foss.st.com>
Content-Language: en-US
In-Reply-To: <35e93102-c4d9-425b-84a5-23d42c5cf73e@foss.st.com>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Drop duplicate pinmux on
	DH STM32 DHCOM
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

Ck9uIDExLzEyLzI0IDEyOjMzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+Cj4gT24g
MTAvMjEvMjQgMjE6NDQsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBUaGUgZXRoZXJuZXQwX3JtaWlf
cGluc19hIHBpbm11eCBjaGFuZ2UgaGFzIG5vIGVmZmVjdCBvbiBhbnkKPj4gREhTT00gYmFzZWQg
aGFyZHdhcmUuIFRoZSBtY28yX3BpbnNfYSBhbmQgbWNvMl9zbGVlcF9waW5zX2EKPj4gYXJlIGJv
dGggcGFydCBvZiBzdG0zMm1wMTUtcGluY3RybC5kdHNpIC4gRHJvcCBib3RoIHBpbm11eAo+PiBj
aGFuZ2VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4K
Pj4gLS0tCj4+IENjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNv
bT4KPj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+
Cj4+IENjOiBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPgo+PiBDYzogdS1ib290QGRoLWVs
ZWN0cm9uaWNzLmNvbQo+PiBDYzogdS1ib290QGxpc3RzLmRlbnguZGUKPj4gQ2M6IHVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4gLS0tCj4+IMKgIGFyY2gvYXJtL2R0
cy9zdG0zMm1wMTV4eC1kaGNvbS11LWJvb3QuZHRzaSB8IDI4IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI4IGRlbGV0aW9ucygtKQo+Pgo+Cj4KPiBSZXZpZXdl
ZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPgo+
IFRoYW5rcwo+IFBhdHJpY2sKPgoKCkFwcGxpZWQgdG8gdS1ib290LXN0bS9tYXN0ZXIsIHRoYW5r
cyEKClJlZ2FyZHMKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
