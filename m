Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C948188D75B
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Mar 2024 08:37:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AFD3C6B45B;
	Wed, 27 Mar 2024 07:37:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE525C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Mar 2024 07:37:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42R3h4qd016250; Wed, 27 Mar 2024 08:36:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=anYEZaI7cauvymeNjcAhUEDssn6FOs1OH2tD7xgAlII=; b=bv
 GbOLymmOSvC3mSDk/F/DsHvdcraHCCX021EYgSjtg0RYc1OILrAOp++D1zPr3dH4
 btDn4g4jvXzJYX6RS+/XY+EqvpruaTUJvlRdoeoP+aEJP1y4OP1E50LhlGP3HkEw
 azs1fQHVbO/3vy7c8lZ+bH7K0NJhAeRpW3bnH7TXuNLuFoQyGE+vDm54L4obgpy3
 +fxmHzwThhSexn4LS8hbtYCBtGI6L7JdK0F8mf3K05SIIXeKqoMYUMlZLzfRJqGb
 qajyL/bGwCytEsatobQzGnIjXUD4xUC28NG4hQCfqMGh79L54a5Fq3rUb+Az9S96
 ivHdeOfJlmok/fGxNLaQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x1pugh61y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Mar 2024 08:36:51 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 185164002D;
 Wed, 27 Mar 2024 08:36:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AB4F20D402;
 Wed, 27 Mar 2024 08:36:26 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Mar
 2024 08:36:25 +0100
Message-ID: <abb5338e-205a-46d3-ae11-cdb6aca5cec8@foss.st.com>
Date: Wed, 27 Mar 2024 08:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240319024430.103196-1-marex@denx.de>
 <f2ab30e8-e65a-4025-a203-639d7ff1b01e@foss.st.com>
 <7ed56763-f494-4d19-82a0-05f0cc557241@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7ed56763-f494-4d19-82a0-05f0cc557241@denx.de>
X-Originating-IP: [10.201.20.71]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_04,2024-03-21_02,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Default dfu_alt_info for
	STM32MP13xx SPI NOR
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

CgpPbiAzLzI2LzI0IDE4OjA4LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAzLzE5LzI0IDExOjIy
IEFNLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDMvMTkvMjQgMDM6NDQsIE1h
cmVrIFZhc3V0IHdyb3RlOgo+Pj4gRGVmaW5lIGRmdV9hbHRfaW5mbyB3aXRoIFNQSSBOT1IgbGF5
b3V0IHRvIG1ha2UgaXQgZWFzeSB0bwo+Pj4gaW5zdGFsbCBvciB1cGRhdGUgYm9vdGxvYWRlciBp
biB0aGUgU1BJIE5PUiB1c2luZyBkZnUtdXRpbC4KPj4+Cj4+PiBVc2UgdGhlIGZvbGxvd2luZyBV
LUJvb3QgY29tbWFuZHMgdG8gc3RhcnQgREZVIG1vZGU6Cj4+PiAiCj4+PiA9PiBzZiBwcm9iZSAm
JiBkZnUgMCBtdGQKPj4+ICIKPj4+Cj4+PiBVc2UgdGhlIGZvbGxvd2luZyBkZnUtdXRpbCBpbnZv
Y2F0aW9uIG9uIEhvc3QgUEMgdG8gaW5zdGFsbCBiaW5hcmllczoKPj4+ICIKPj4+ICQgZGZ1LXV0
aWwgLXcgLWEgMCAtRCBidWlsZC9zdG0zMm1wMS9yZWxlYXNlL3RmLWEtc3RtMzJtcDEzNWYtZGhj
b3ItZGhzYmMuc3RtMzIKPj4+ICQgZGZ1LXV0aWwgLXcgLWEgMSAtRCBidWlsZC9zdG0zMm1wMS9y
ZWxlYXNlL3RmLWEtc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMuc3RtMzIKPj4+ICQgZGZ1LXV0aWwg
LXcgLWEgMiAtRCBidWlsZC9zdG0zMm1wMS9yZWxlYXNlL2ZpcC5iaW4KPj4+ICIKPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+IC0tLQo+Pj4gQ2M6
IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pj4gQ2M6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+PiBDYzogVG9t
IFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4KPj4+IENjOiB1LWJvb3RAZGgtZWxlY3Ryb25pY3Mu
Y29tCj4+PiBDYzogdS1ib290QGxpc3RzLmRlbnguZGUKPj4+IENjOiB1Ym9vdC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+PiAtLS0KPj4+IMKgIGluY2x1ZGUvY29uZmlncy9z
dG0zMm1wMTNfY29tbW9uLmggfCAxICsKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDEzX2NvbW1v
bi5oIGIvaW5jbHVkZS9jb25maWdzL3N0bTMybXAxM19jb21tb24uaAo+Pj4gaW5kZXggNWIwNjU4
Y2VkOTIuLmQ2ZTRmOGZkOTE1IDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9jb25maWdzL3N0bTMy
bXAxM19jb21tb24uaAo+Pj4gKysrIGIvaW5jbHVkZS9jb25maWdzL3N0bTMybXAxM19jb21tb24u
aAo+Pj4gQEAgLTYzLDYgKzYzLDcgQEAKPj4+IMKgwqDCoMKgwqAgImZpO1wwIgo+Pj4gwqAgwqAg
I2RlZmluZSBTVE0zMk1QX0VYVFJBIFwKPj4+ICvCoMKgwqAgImRmdV9hbHRfaW5mbz1tdGQgbm9y
MD1mc2JsMSByYXcgMHgwIDB4NDAwMDA7ZnNibDIgcmF3IDB4NDAwMDAgMHg0MDAwMDt1Ym9vdCBy
YXcgMHg4MDAwMCAweDE2MDAwMFwwIiBcCj4+PiDCoMKgwqDCoMKgICJlbnZfY2hlY2s9aWYgZW52
IGluZm8gLXAgLWQgLXE7IHRoZW4gZW52IHNhdmU7IGZpXDAiIFwKPj4+IMKgwqDCoMKgwqAgImJv
b3RfbmV0X3VzYl9zdGFydD10cnVlXDAiCj4+PiDCoCAKPj4KPj4KPj4gSGkgTWFyZWsKPj4KPj4g
T24gb3VyIFNUTTMyIGJvYXJkLCB0aGUgZGZ1X2FsdF9pbmZvIGlzIGJ1aWxkIGR5bmFtaWNhbGx5
LCB3ZSBoYXZlIENPTkZJR19TRVRfREZVX0FMVF9JTkZPIGVuYWJsZQo+PiBDYW4geW91IGFkZCB0
aGUgZGZ1X2FsdF9pbmZvIGluIGEgc3BlY2lmaWMgc3RtMzJtcDEzX2RoeHguY29tbW9uLmggaW5z
dGVhZCA/Cj4gCj4gWW91IGNhbiBkcm9wIHRoaXMgcGF0Y2guCgoKT2sgdGhhbmtzCgpQYXRyaWNl
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0
bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vi
b290LXN0bTMyCg==
