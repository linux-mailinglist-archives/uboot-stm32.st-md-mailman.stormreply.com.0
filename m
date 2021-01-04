Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4294C2E95B3
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Jan 2021 14:18:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBD14C56632;
	Mon,  4 Jan 2021 13:18:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39959C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jan 2021 13:18:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 104DDu51019726; Mon, 4 Jan 2021 14:18:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1PRsSQRkMCKELBaNZgZ7aJTDHXnJYREoWc8nMJWNFgU=;
 b=KBNahOlr8WlZawXiIGFHBcDsf/Ufum8ee/VHCPFvYzIjJuZw3bQP6lXIvaA6sKsVdOzd
 7crKoip21UFOwcHShKPDdEm5XKwmdwMkknHhxWsWkcHmMIIk6Q36VI8A2SASxWz+QmuR
 gw6k0vODfDBr1scJ6Meg8t3VSKvVJtb2GHAHARNy3YZEX97/nvz7INuw7D6wc3mWRZ/l
 mms/fE4fD96+JDx/5Q75xRBE51z+eZqPqM50jm/R8UHZVbjXrTrz5dCy44Clq5p1tNJx
 qg+Qvg4WbDYgVP2l1vwk0swIlKle7ZsWw5G4N0+KDN6Ie1GXpGcD4OnVI6VwT2TZ7A86 nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35tgkmj3x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 14:18:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D63010002A;
 Mon,  4 Jan 2021 14:18:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F8D5207529;
 Mon,  4 Jan 2021 14:18:20 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Jan
 2021 14:18:19 +0100
To: Simon Glass <sjg@chromium.org>
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
 <20201218124642.v3.3.I3e15d39becc5c180a3be52571bb570e29c6b4cd0@changeid>
 <CAPnjgZ1dgdU2S3tT5PD7=92gBZG0e+LXwyDn-MJbNmGyKkFGNw@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <910629f3-49c2-a9a6-1334-5d690664ffe7@foss.st.com>
Date: Mon, 4 Jan 2021 14:18:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ1dgdU2S3tT5PD7=92gBZG0e+LXwyDn-MJbNmGyKkFGNw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_08:2021-01-04,
 2021-01-04 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 3/4] console: remove #ifdef
	CONFIG_CONSOLE_RECORD
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

Ck9uIDEyLzE5LzIwIDQ6MzQgQU0sIFNpbW9uIEdsYXNzIHdyb3RlOgo+IE9uIEZyaSwgMTggRGVj
IDIwMjAgYXQgMDQ6NDYsIFBhdHJpY2sgRGVsYXVuYXkKPiA8cGF0cmljay5kZWxhdW5heUBmb3Nz
LnN0LmNvbT4gd3JvdGU6Cj4+IEZyb206IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVu
YXlAc3QuY29tPgo+Pgo+PiBBZGQgaGVscGVyIGZ1bmN0aW9ucyB0byBhY2Nlc3MgdG8gZ2QtPmNv
bnNvbGVfb3V0IGFuZCBnZC0+Y29uc29sZV9pbgo+IEkgZG9uJ3Qgc2VlIHRob3NlIGluIHRoaXMg
cGF0Y2gKClRoZXNlIGhlbHBlciBmdW5jdGlvbiBhcmUgY29uc29sZV9yZWNvcmRfcHV0YygpIC8g
X3B1dHMoKcKgIC8gX2dldGMoKSAvIApfdHN0YygpOwoKdGhleSB1c2UgImdkLT5jb25zb2xlX291
dCIgYW5kICJnZC0+Y29uc29sZV9pbiIgb25seSBpZiAKQ09ORklHX0NPTlNPTEVfUkVDT1JEIGlz
IGRlZmluZWQ6CgpkaWZmIC0tZ2l0IGEvY29tbW9uL2NvbnNvbGUuYyBiL2NvbW1vbi9jb25zb2xl
LmMgaW5kZXggCjAzNmRkMDM1OGEuLjI5NWMxMGYyNDIgMTAwNjQ0CgotLS0gYS9jb21tb24vY29u
c29sZS5jCgorKysgYi9jb21tb24vY29uc29sZS5jCgpAQCAtODgsNiArODgsNjQgQEAgc3RhdGlj
IGludCBvbl9zaWxlbnQoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAKKnZhbHVlLCBlbnVt
IGVudl9vcCBvcCwgVV9CT09UX0VOVl9DQUxMQkFDSyhzaWxlbnQsIG9uX3NpbGVudCk7ICNlbmRp
ZgoKKyNpZmRlZiBDT05GSUdfQ09OU09MRV9SRUNPUkQKCisvKiBoZWxwZXIgZnVuY3Rpb246IGFj
Y2VzcyB0byBnZC0+Y29uc29sZV9vdXQgYW5kIGdkLT5jb25zb2xlX2luICovCgouLi4KCisjZWxz
ZQoKLi4uIHN0dWJzID0+IGRvIG5vdGhpbmdzCgorI2VuZGlmCgo+Cj4+IHdpdGggbWVtYnVmZiBB
UEkgYW5kIHJlcGxhY2UgdGhlICNpZmRlZiBDT05GSUdfQ09OU09MRV9SRUNPUkQgdGVzdAo+PiBi
eSBpZiAoSVNfRU5BQkxFRChDT05GSUdfQ09OU09MRV9SRUNPUkQpKSB0byByZXNwZWN0IHRoZSBV
LUJvb3QKPj4gY29kaW5nIHJ1bGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVu
YXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERl
bGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gKG5vIGNo
YW5nZXMgc2luY2UgdjIpCj4+Cj4+IENoYW5nZXMgaW4gdjI6Cj4+IC0gbW92ZSB0aGUgdGVzdHMg
b24gZ2QtPmZsYWdzICYgR0RfRkxHX1JFQ09SRCBpbiBoZWxwZXIgZnVuY3Rpb25zCj4+IC0gcmVt
b3ZlIHRlc3Qgb24gSVNfRU5BQkxFRChDT05GSUdfQ09OU09MRV9SRUNPUkQpCj4+ICAgIGJlZm9y
ZSB0byBjYWxsIGhlbHBlciBmdW5jdGlvbnMKPj4KPj4gICBjb21tb24vY29uc29sZS5jIHwgOTUg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+Pgo+IFJldmll
d2VkLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4KCgpSZWdhcmRzCgpQYXRyaWNr
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=
