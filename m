Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6788AAE4D
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:17:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45F47C6DD9C;
	Fri, 19 Apr 2024 12:17:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B101C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:17:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J8Eere031243; Fri, 19 Apr 2024 14:17:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=eyW4zfe8UDNJ3nF63z/6myHs0jAtXesHH19xeUwMVz4=; b=sn
 BLdHe7ZZ/LCXmci17TcyjjP1yEsPaDvaIRoO1nBLDm5f9LzTu7H8EMi/CF67UkkE
 o1UiDUDlM9eEos9WlSraHZNnPvMaj2FUp2EO2oCZYtxtpUdUOQ5kmlaa549Q/4GX
 U1uPPVmsxibnUYAop5V4h+bfTD7OC61OxVp0b5bn4v6yCQ5XmKBNZSEgzM3iGS4G
 zRbD1+brxozS4qIgHeSp1RrC11X8qMVljZYqc8VZlVpJ77wOGqGNd32Z2yp0UfdF
 0ujT3v2CSnOJo7FMSytW0oCVmLMJfPp6q/J8F0DYZIdYJ9bmxk6hMmA/Jw0s29Pl
 SsbAFoU+g1rcgSRpny+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xfhcx44et-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:17:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E82E140045;
 Fri, 19 Apr 2024 14:17:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48E6A2194FA;
 Fri, 19 Apr 2024 14:17:10 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:17:09 +0200
Message-ID: <ec2be059-6aa4-4f48-ae90-632cddc06165@foss.st.com>
Date: Fri, 19 Apr 2024 14:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-9-patrice.chotard@foss.st.com>
 <c7cd7bb9-d0a9-4e25-92d3-51aba895a54b@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <c7cd7bb9-d0a9-4e25-92d3-51aba895a54b@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 08/25] ARM: dts: stm32: Don't probe
 led-red/led-blue at boot for stm32mp135f-dk-u-boot
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

CgpPbiA0LzE3LzI0IDExOjA2LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvOS8yNCAxNzowMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBsZWQtcmVkIGFuZCBidXR0
b24gZGVkaWNhdGVkIHRvIGZhc3Rib290IHNoYXJlIHRoZSBzYW1lIGdwaW8gR1BJT0ExMy4KPj4g
bGVkLWJsdWUgYW5kIGJ1dHRvbiBkZWRpY2F0ZWQgdG8gc3RtMzJwcm9nIHNoYXJlIHRoZSBzYW1l
IGdwaW8gR1BJT0ExNC4KPj4gTGVkIGRyaXZlciBpcyBwcm9iZWQgZWFybHkgc28gdGhlIGNvcnJl
c3BvbmRpbmcgZ3BpbyBpcyB0YWtlbiBhbmQKPj4gY29uZmlndXJlZCBpbiBvdXRwdXQgd2hpY2gg
Zm9yYmlkIGZhc3Rib290IGFuZCBzdG0zMnByb2cgYnV0dG9uIHVzYWdlLgo+Pgo+PiBUbyBhdm9p
ZCB0aGlzLCByZW1vdmUgdGhlICJkZWZhdWx0LXN0YXRlIiBwcm9wZXJ0eSBmcm9tIGxlZC1yZWQg
YW5kCj4+IGxlZC1ibHVlIGxlZCdzIG5vZGUuCj4+Cj4+IFRoaXMgd2lsbCBhdm9pZCB0byB0cmln
Z2VyIHRoZSBsZWQgZHJpdmVyIHByb2JlKCkgdG8gY29uZmlndXJlIHRoZSBsZWQKPj4gZGVmYXVs
dCBzdGF0ZSBkdXJpbmcgc3RhcnR1cC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90
YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2Fy
bS9kdHMvc3RtMzJtcDEzNWYtZGstdS1ib290LmR0c2kgfCA1ICsrKystCj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPiAKPiAKPiBSZXZpZXdl
ZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAK
PiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQgb24gdS1ib290LXN0bTMyL21hc3RlciAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIg
bWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qt
c3RtMzIK
