Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3B8AAE4A
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:17:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 317D3C6DD9A;
	Fri, 19 Apr 2024 12:17:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6943C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:17:16 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JAuZ1E020533; Fri, 19 Apr 2024 14:17:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Cn7Bu06685UEHkCZNavB9QL7x1ok/4NgYL7DF/NZCpk=; b=OA
 6X3niRsdiPIqIVoMiAfCp7BDczOjZuyNdEj3R7XcNNHHHaY8QJYuheecSI/EmU/O
 OL1kF+N6HAiPOlSzTEy3BIJinwvzL7bLLiNKnXuK4oIkftVMJNCe5XK7EXna+KLn
 WMyTo6EfD/19fGFRo3Lts0l8ySEP3lllm5gQd9aDcFwpU8anaQadWbLIhSmY27Zp
 gwxL93QSj/apS9G/lgqVCXOhULx5Uv0QQWbfPcZqGzCPdxF8R4pbrsFLiQWlOs6t
 hQAp2NRWVryShdnzLAoBEH22KzbX7C0cyPBeRmV38bGmJ+9YLYiJwwiMlpAS201d
 wppcNu6Z7SUB9s5N+GSA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg3m129cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:17:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7B3E740047;
 Fri, 19 Apr 2024 14:17:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FF6B21A204;
 Fri, 19 Apr 2024 14:16:46 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:16:45 +0200
Message-ID: <7b86b471-0379-4e1b-9fa2-99fcc46cc36e@foss.st.com>
Date: Fri, 19 Apr 2024 14:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Igor Opaniuk <igor.opaniuk@gmail.com>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-6-patrice.chotard@foss.st.com>
 <CAByghJZG403R9g0S+Q+aDgiCh74j_JzY+CXydv33mLCjSwFjLg@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAByghJZG403R9g0S+Q+aDgiCh74j_JzY+CXydv33mLCjSwFjLg@mail.gmail.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 05/25] configs: stm32mp1: Enable
 BUTTON_GPIO flag for stm32mp13_defconfig
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

CgpPbiA0LzE4LzI0IDEzOjQ4LCBJZ29yIE9wYW5pdWsgd3JvdGU6Cj4gT24gVHVlLCBBcHIgOSwg
MjAyNCBhdCA1OjA14oCvUE0gUGF0cmljZSBDaG90YXJkCj4gPHBhdHJpY2UuY2hvdGFyZEBmb3Nz
LnN0LmNvbT4gd3JvdGU6Cj4+Cj4+IEVuYWJsZSBCVVRUT05fR1BJTyBmbGFnIGZvciBTVE0zMk1Q
MTUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gIGNvbmZpZ3Mvc3RtMzJtcDEzX2RlZmNvbmZpZyB8
IDIgKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdp
dCBhL2NvbmZpZ3Mvc3RtMzJtcDEzX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzJtcDEzX2RlZmNv
bmZpZwo+PiBpbmRleCBkYjA5ZTYzMTAwZS4uY2FhYWJmMzllZjMgMTAwNjQ0Cj4+IC0tLSBhL2Nv
bmZpZ3Mvc3RtMzJtcDEzX2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL3N0bTMybXAxM19kZWZj
b25maWcKPj4gQEAgLTUyLDYgKzUyLDggQEAgQ09ORklHX1NZU19SRURVTkRBTkRfRU5WSVJPTk1F
TlQ9eQo+PiAgQ09ORklHX1NZU19SRUxPQ19HRF9FTlZfQUREUj15Cj4+ICBDT05GSUdfU1lTX01N
Q19FTlZfREVWPS0xCj4+ICBDT05GSUdfRU5WX01NQ19VU0VfRFQ9eQo+PiArQ09ORklHX0JVVFRP
Tj15Cj4+ICtDT05GSUdfQlVUVE9OX0dQSU89eQo+PiAgQ09ORklHX0NMS19TQ01JPXkKPj4gIENP
TkZJR19TRVRfREZVX0FMVF9JTkZPPXkKPj4gIENPTkZJR19VU0JfRlVOQ1RJT05fRkFTVEJPT1Q9
eQo+PiAtLQo+PiAyLjI1LjEKPj4KPiAKPiBSZXZpZXdlZC1ieTogSWdvciBPcGFuaXVrIDxpZ29y
Lm9wYW5pdWtAZ21haWwuY29tPgoKQXBwbGllZCBvbiB1LWJvb3Qtc3RtMzIvbWFzdGVyIApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
