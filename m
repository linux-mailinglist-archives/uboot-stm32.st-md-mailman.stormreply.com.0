Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553052143F
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 13:52:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1C1EC035BF;
	Tue, 10 May 2022 11:52:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5485C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 11:52:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AA2VIs032368;
 Tue, 10 May 2022 13:52:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=otVdAjI/OSJzzKD16o1Zxy8XfBtoqaabx1IXqs2iN7Q=;
 b=KE1OUpR9c523JEUsZZI8w3SmkZ+747gNwt92+VaOVdLJ5Gq4XDAkou1xKTc4b/TfV7KX
 KeswEYtPP5CtIX7gRbfoSkBVTlB2pPhgkddzx4JUgwfEMJJZQFuh9Ch7mGXAovJEYYwm
 HSGAMiCJUPd1Le0U5fQs081yE0JQPJ7YRa95yKGRYSKEdMrg3VXCN35iQJIYTznAuVSW
 3JVPVOfxY8ngBk+UN+2RTzZIUW6+G47wx8RbTzatUG+37Zkiads4dhEnEovs1WbTDYvw
 RKAalppX5ECgAq+wszxI4su/9TQHJ/lCBj5KvofB1RiLQNf8gamQNe/Lu4SoRYsYdh7v bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwfnghurb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 13:52:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C56B110002A;
 Tue, 10 May 2022 13:52:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF0FF21BF4B;
 Tue, 10 May 2022 13:52:01 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 13:52:01 +0200
Message-ID: <153bde2f-1faa-c46d-f4f0-310942a826dd@foss.st.com>
Date: Tue, 10 May 2022 13:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220422073900.15786-1-patrice.chotard@foss.st.com>
 <53a81962-1ef9-3796-cae7-8072afd6af4c@foss.st.com>
 <bd53472a-3406-954c-40db-0bc9ea7e9772@foss.st.com>
 <93b168ef-5a2b-762a-3d59-726d15060f19@foss.st.com>
In-Reply-To: <93b168ef-5a2b-762a-3d59-726d15060f19@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-10_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] phy: stm32-usbphyc: stm32-usbphyc: Add DT
 phy tuning support
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

TXkgQmFkLCB0aGlzIHBhdGNoIGlzIG5vdCBjb25jZXJuZWQsIGkga2VlcCBpdCBtZXJnZWQgaW4g
U1RNMzIgY3VzdG9kaWFuIG1hc3Rlci4KCk9uIDUvMTAvMjIgMTM6NTAsIFBhdHJpY2UgQ0hPVEFS
RCB3cm90ZToKPiBBZnRlciBkaXNjdXNzaW9uIHdpdGggUGF0cmljaywgdGhlIHdob2xlIHNlcmll
cyB3aWxsIG5vdCBiZSBtZXJnZWQgaW4gc3RtMzIgZ2l0IGN1c3RvZGlhbiBtYXN0ZXIgYnJhbmNo
Cj4gCj4gUGF0cmljZQo+IAo+IE9uIDUvMTAvMjIgMTA6MTAsIFBhdHJpY2UgQ0hPVEFSRCB3cm90
ZToKPj4KPj4KPj4gT24gNS82LzIyIDEwOjUwLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+Pj4g
SGkKPj4+Cj4+PiBPbiA0LzIyLzIyIDA5OjM5LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+Pj4g
QWRkIHN1cHBvcnQgb2YgcGh5LXR1bmluZyBwcm9wZXJ0aWVzIGZvciBzbTMyLXVzYnBoeWMncyBw
aHkgdHVuaW5nCj4+Pj4gYWxpZ25lZCB3aXRoIHY1LjE1IGtlcm5lbCBiaW5kaW5ncy4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Mu
c3QuY29tPgo+Pj4+IC0tLQo+Pj4+Cj4+Pj4gwqAgZHJpdmVycy9waHkvcGh5LXN0bTMyLXVzYnBo
eWMuYyB8IDE2NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCAxNjcgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+Pgo+Pj4gVGhh
bmtzCj4+PiBQYXRyaWNrCj4+Pgo+Pj4KPj4gQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIKPj4KPj4g
VGhhbmtzCj4+IFBhdHJpY2UKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IFVib290LXN0bTMyIG1haWxpbmcgbGlzdAo+IFVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
