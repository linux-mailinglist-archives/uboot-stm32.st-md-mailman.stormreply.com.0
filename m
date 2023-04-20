Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD236E8D92
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Apr 2023 11:08:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16AEEC65048;
	Thu, 20 Apr 2023 09:08:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C17DC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Apr 2023 09:08:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33K5nZlu009422; Thu, 20 Apr 2023 11:08:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ixzrupYHuNLSlS/1aLe+T5CKNnyBWOsgxMuJZHhDODc=;
 b=uRKANexAAaZxdlPduGJMgHBeaeCmqkUHdY4xVOvxzx1CdtPQSCk/RRh4E/oV6EemeBNv
 b81V13342JaXG2dbE/jrghcwLvwZEOgiLbU7bc8rzCnmBoiM+Y/6y8IfVA+EWbnQeDCK
 n30laGR0fya3aiu2Yfqt+v4myRhgstkjzSBLWsVq6PuR4UU3QPi5BQgn7H3+JJken2BV
 hcSY0xPwmPNs7h4jiErq5S3LNCHzHAc+AsbZrXY+KhJBqSDtEBie98PjkfhuxmNv4+ah
 wtUi7QHeySsB3qE/wwGK8NHq2WU96kX2pSFUpmXti64nT1trJKWHjz2mg9Rx1SIUtpoC jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q2eeqqq95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 11:08:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2903410002A;
 Thu, 20 Apr 2023 11:08:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10B7B214D21;
 Thu, 20 Apr 2023 11:08:37 +0200 (CEST)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 20 Apr
 2023 11:08:36 +0200
Message-ID: <a89618b6-df55-79cf-77be-0f250bf1040e@foss.st.com>
Date: Thu, 20 Apr 2023 11:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230418135941.774340-1-patrick.delaunay@foss.st.com>
 <20230418155937.2.Id975ebfa1953ef54fc7558442f64a693fa74bc3a@changeid>
 <eb7556d1-8283-70dd-790c-925c10ba02a0@denx.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <eb7556d1-8283-70dd-790c-925c10ba02a0@denx.de>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_05,2023-04-18_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32mp: alignment with
	v6.3-rc3
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

SGksCgpPbiA0LzE4LzIzIDIxOjE0LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA0LzE4LzIzIDE1
OjU5LCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBEZXZpY2UgdHJlZSBhbGlnbm1lbnQgd2l0
aCBMaW51eCBrZXJuZWwgdjYuMy1yYzM6Cj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBhZGQgaTJjIG5v
ZGVzIGludG8gc3RtMzJtcDEzMS5kdHNpCj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBlbmFibGUgaTJj
MSBhbmQgaTJjNSBvbiBzdG0zMm1wMTM1Zi1kay5kdHMKPj4gLSBBUk06IGR0czogc3RtMzI6IGFk
ZCBzcGkgbm9kZXMgaW50byBzdG0zMm1wMTMxLmR0c2kKPj4gLSBBUk06IGR0czogc3RtMzI6IGFk
ZCBwaW5jdHJsIGFuZCBkaXNhYmxlZCBzcGk1IG5vZGUgaW4gc3RtMzJtcDEzNWYtZGsKPj4gLSBB
Uk06IGR0czogc3RtMzI6IENyZWF0ZSBzZXBhcmF0ZSBwaW5tdXggZm9yIHFzcGkgY3MgcGluIGlu
Cj4+IMKgwqAgc3RtMzJtcDE1LXBpbmN0cmwuZHRzaQo+PiAtIEFSTTogZHRzOiBzdG0zMjogUmVu
YW1lIG1kaW8wIHRvIG1kaW8KPj4gLSBBUk06IGR0czogc3RtMzI6IFJlcGxhY2UgU0FJIGZvcm1h
dCB3aXRoIGRhaS1mb3JtYXQgRFQgcHJvcGVydHkKPj4gLSBBUk06IGR0czogc3RtMzI6IGFkZCBh
ZGMgc3VwcG9ydCB0byBzdG0zMm1wMTMKPj4gLSBBUk06IGR0czogc3RtMzI6IGFkZCBhZGMgcGlu
cyBtdXhpbmcgb24gc3RtMzJtcDEzNWYtZGsKPj4gLSBBUk06IGR0czogc3RtMzI6IGFkZCBkdW1t
eSB2ZGRfYWRjIHJlZ3VsYXRvciBvbiBzdG0zMm1wMTM1Zi1kawo+PiAtIEFSTTogZHRzOiBzdG0z
MjogYWRkIGFkYyBzdXBwb3J0IG9uIHN0bTMybXAxMzVmLWRrCj4+IC0gQVJNOiBkdHM6IHN0bTMy
OiBhZGQgUFdSIGZpeGVkIHJlZ3VsYXRvcnMgb24gc3RtMzJtcDEzMQo+PiAtIEFSTTogZHRzOiBz
dG0zMjogYWRkIFVTQlBIWUMgYW5kIGR1YWwgVVNCIEhTIFBIWSBzdXBwb3J0IG9uIHN0bTMybXAx
MzEKPj4gLSBBUk06IGR0czogc3RtMzI6IGFkZCBVQlNIIEVIQ0kgYW5kIE9IQ0kgc3VwcG9ydCBv
biBzdG0zMm1wMTMxCj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBhZGQgVVNCIE9URyBIUyBzdXBwb3J0
IG9uIHN0bTMybXAxMzEKPj4gLSBBUk06IGR0czogc3RtMzI6IGFkZCBmaXhlZCByZWd1bGF0b3Jz
IHRvIHN1cHBvcnQgdXNiIG9uIHN0bTMybXAxMzVmLWRrCj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBl
bmFibGUgVVNCIEhTIHBoeXMgb24gc3RtMzJtcDEzNWYtZGsKPj4gLSBBUk06IGR0czogc3RtMzI6
IGVuYWJsZSBVU0IgSG9zdCBFSENJIG9uIHN0bTMybXAxMzVmLWRrCj4+IC0gQVJNOiBkdHM6IHN0
bTMyOiBhZGQgcGlucyBmb3Igc3RtMzJnMCB0eXBlYyBjb250cm9sbGVyIG9uIHN0bTMybXAxMwo+
PiAtIEFSTTogZHRzOiBzdG0zMjogZW5hYmxlIFVTQiBPVEcgaW4gZHVhbCByb2xlIG1vZGUgb24g
c3RtMzJtcDEzNWYtZGsKPj4gLSBBUk06IGR0czogc3RtMzI6IGFkZCBtY3AyMzAxNyBwaW5jdHJs
IGVudHJ5IGZvciBzdG0zMm1wMTMKPj4gLSBBUk06IGR0czogc3RtMzI6IGFkZCBtY3AyMzAxNyBJ
TyBleHBhbmRlciBvbiBJMkMxIG9uIHN0bTMybXAxMzVmLWRrCj4+IC0gQVJNOiBkdHM6IHN0bTMy
OiBGaXggcXNwaSBwaW5jdHJsIHBoYW5kbGUgZm9yIHN0bTMybXAxNXh4LWRoY29yLXNvbQo+PiAt
IEFSTTogZHRzOiBzdG0zMjogRml4IHFzcGkgcGluY3RybCBwaGFuZGxlIGZvciBzdG0zMm1wMTV4
eC1kaGNvbS1zb20KPj4gLSBBUk06IGR0czogc3RtMzI6IEZpeCBxc3BpIHBpbmN0cmwgcGhhbmRs
ZSBmb3Igc3RtMzJtcDE1MWEtcHJ0dDFsCj4+IC0gQVJNOiBkdHM6IHN0bTMyOiByZW1vdmUgc2Fp
IGtlcm5lbCBjbG9jayBvbiBzdG0zMm1wMTV4eC1ka3gKPj4gLSBBUk06IGR0czogc3RtMzI6IHJl
bmFtZSBzb3VuZCBjYXJkIG9uIHN0bTMybXAxNXh4LWRreAo+PiAtIEFSTTogZHRzOiBzdG0zMjog
UmVtb3ZlIHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eQo+PiAtIEFSTTogZHRzOiBzdG0z
MjogYWRkIGkycyBub2RlcyBvbiBzdG0zMm1wMTMxCj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBhZGQg
c2FpIG5vZGVzIG9uIHN0bTMybXAxMzEKPj4gLSBBUk06IGR0czogc3RtMzI6IGFkZCBzcGRpZnJ4
IG5vZGUgb24gc3RtMzJtcDEzMQo+PiAtIEFSTTogZHRzOiBzdG0zMjogYWRkIGRmc2RtIG5vZGUg
b24gc3RtMzJtcDEzMQo+PiAtIEFSTTogZHRzOiBzdG0zMjogYWRkIHRpbWVycyBzdXBwb3J0IG9u
IHN0bTMybXAxMzEKPj4gLSBBUk06IGR0czogc3RtMzI6IGFkZCB0aW1lciBwaW5zIG11eGluZyBm
b3Igc3RtMzJtcDEzNWYtZGsKPj4gLSBBUk06IGR0czogc3RtMzI6IGFkZCB0aW1lcnMgc3VwcG9y
dCBvbiBzdG0zMm1wMTM1Zi1kawo+PiAtIEFSTTogZHRzOiBzdG0zMjogRml4IFVzZXIgYnV0dG9u
IG9uIHN0bTMybXAxMzVmLWRrCj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBVc2UgbmV3IG1lZGlhIGJ1
cyB0eXBlIG1hY3Jvcwo+PiAtIEFSTTogZHRzOiBzdG0zMjogVXBkYXRlIHBhcnQgbnVtYmVyIE5W
TUVNIGRlc2NyaXB0aW9uIG9uIHN0bTMybXAxMzEKPgo+IFBsZWFzZSBlaXRoZXIgaW5jbHVkZSBj
b21taXQgSURzIGZvciBhbGwgdGhvc2UgY29tbWl0cyB0b28sIG9yIGp1c3QgCj4gaW5jbHVkZSBj
b21taXQgSUQgb2YgdGhlIGtlcm5lbCB2ZXJzaW9uIHRvIHdoaWNoIHRoZXNlIERUcyBhcmUgc3lu
Y2VkIAo+IHRvLiBJIHdvdWxkIHByZWZlciB0aGUgbGF0ZXIuCgoKT0ssIEkgbm90ZSBpdAoKCj4g
QWxzbyBub3RlLCBMaW51eCA2LjMtcmM2IGlzIG91dCwgc28gd2h5IHN5bmMgdG8gNi4zLXJjMyA/
CgoKbm8gcmVhc29uOsKgIEl0IHdhcyB0aGUgdmVyc2lvbiBhdmFpbGFibGUgd2hlbiBJIHN0YXJ0
IHRoZSAKc3luY2hyb25pemF0aW9uLi4uLgoKYW5kIEkgZG9uJ3Qgc2VlIG5ldyBwYXRjaGVzIG9u
IHRoZcKgIHN0bTMybXAgZGV2aWNlIHRyZWVzIHNpbmNlIHY2LjMtcmMxCgphbmQgdGhlIHB1bGwg
cmVxdWVzdCBzdG0zMi1kdC1mb3ItdjYuMy0xLgoKCkkgY2FuIHVwZGF0ZSB0aGUgY29tbWl0IG1l
c3NhZ2UgaWYgaXQgaXMgbmVlZGVkLgoKClBhdHJpY2sKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
