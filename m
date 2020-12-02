Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B842CC402
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 18:40:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 112EAC06150;
	Wed,  2 Dec 2020 17:40:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B752C424C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 17:40:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2HarLE004234; Wed, 2 Dec 2020 18:40:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Rdcnt7SyJOX7ygPfqCIYFMSug1sJFl3oT4lNrjNijdw=;
 b=Ou+ywLniWYAwGQiLF4LKVZuVOVa4IrPrIGkdIi3qq8ISp6bd/zI2x3wIChSZ9JoGz5E8
 n6+kJr7oumnuaqUZebTCQnIX956/pz+4aZQ/qM+K9dxXW5MNzgsov6+oDxBZvHxszbNM
 W2SCMTSLsm4xY7C+22US12ei653U8/tRQ2/+7Y40LiQG7czfC8mux5gYaZd7hWwUbq7M
 0fYSjAhBNxF07aPlnLRuR/+FRb89OvYqlfoOJv9vSemxZo3PLYx0D4wAzODyDT+UDyCr
 ut7Nq9Z+o4fN5kqUuNDsmqVFisw8Y1zO9y4iv1A8n9QXkpyuhpGpPP0ptFSIjhalEwqQ ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3ccxhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 18:40:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2A3E10002A;
 Wed,  2 Dec 2020 18:40:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97256239481;
 Wed,  2 Dec 2020 18:40:21 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 18:40:20 +0100
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, <u-boot@lists.denx.de>
References: <20201202172110.7809-1-patrice.chotard@foss.st.com>
 <d568fed8-9a8f-02d1-c2f3-cc95598c3ac3@gmx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <7148da99-e710-8a4c-faf0-86a69812cffa@foss.st.com>
Date: Wed, 2 Dec 2020 18:40:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d568fed8-9a8f-02d1-c2f3-cc95598c3ac3@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_10:2020-11-30,
 2020-12-02 signatures=0
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Amit Singh Tomar <amittomer25@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sean Anderson <seanga2@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Robert Marko <robert.marko@sartura.hr>
Subject: Re: [Uboot-stm32] [PATCH 1/2] MAINTAINERS: Update ARM STI and ARM
 STM STM32MP Arch maintainers emails
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

SGkgSGVpbnJpY2gKCk9uIDEyLzIvMjAgNjozMSBQTSwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90
ZToKPiBPbiAxMi8yLzIwIDY6MjEgUE0sIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gVXBkYXRl
IFBhdHJpY2sgYW5kIG15IGVtYWlsIGFkZHJlc3Mgd2l0aCB0aGUgb25lIGRlZGljYXRlZCB0bwo+
PiB1cHN0cmVhbSBhY3Rpdml0aWVzLgo+Cj4gSXQgbWlnaHQgbWFrZSBzZW5zZSB0byBhZGQgZW50
cmllcyB0byAubWFpbG1hcCB0b28gaWYgeW91IGhhdmUKPiBjb250cmlidXRlZCB0byBmaWxlcyB3
aGVyZSB5b3UgYXJlIG5vdCB0aGUgbWFpbnRhaW5lci4KCkkgd2FzIG5vdCBhd2FyZSBvZiB0aGlz
IGZpbGUsIHRoYW5rcyBmb3IgdGhlIHRpcHMgOy0pCgpQYXRyaWNlCgoKPgo+IEJlc3QgcmVnYXJk
cwo+Cj4gSGVpbnJpY2gKPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBh
dHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIE1BSU5UQUlORVJTIHwg
NiArKystLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPj4gaW5k
ZXggODc0Y2YyYzBlNS4uZWQ1ZDdjM2FiNiAxMDA2NDQKPj4gLS0tIGEvTUFJTlRBSU5FUlMKPj4g
KysrIGIvTUFJTlRBSU5FUlMKPj4gQEAgLTM4NSw3ICszODUsNyBAQCBGOsKgwqDCoCBkcml2ZXJz
L3NtZW0vbXNtX3NtZW0uYwo+PiDCoCBGOsKgwqDCoCBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktbXNt
LmMKPj4KPj4gwqAgQVJNIFNUSQo+PiAtTTrCoMKgwqAgUGF0cmljZSBDaG90YXJkIDxwYXRyaWNl
LmNob3RhcmRAc3QuY29tPgo+PiArTTrCoMKgwqAgUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAZm9zcy5zdC5jb20+Cj4+IMKgIFM6wqDCoMKgIE1haW50YWluZWQKPj4gwqAgVDrCoMKg
wqAgZ2l0IGh0dHBzOi8vZ2l0bGFiLmRlbnguZGUvdS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0
bS5naXQKPj4gwqAgRjrCoMKgwqAgYXJjaC9hcm0vbWFjaC1zdGkvCj4+IEBAIC00MTEsOCArNDEx
LDggQEAgRjrCoMKgwqAgYXJjaC9hcm0vY3B1L2FybTkyNmVqcy9zcGVhci8KPj4gwqAgRjrCoMKg
wqAgYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJjaC1zcGVhci8KPj4KPj4gwqAgQVJNIFNUTSBTVE0z
Mk1QCj4+IC1NOsKgwqDCoCBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNv
bT4KPj4gLU06wqDCoMKgIFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4K
Pj4gK006wqDCoMKgIFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5j
b20+Cj4+ICtNOsKgwqDCoCBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbT4KPj4gwqAgTDrCoMKgwqAgdWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbSAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCj4+IMKgIFQ6wqDCoMKgIGdpdCBo
dHRwczovL2dpdGxhYi5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0uZ2l0Cj4+
IMKgIFM6wqDCoMKgIE1haW50YWluZWQKPj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
