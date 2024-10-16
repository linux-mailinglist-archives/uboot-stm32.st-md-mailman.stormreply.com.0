Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B45A9A1169
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2024 20:19:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7674C78035;
	Wed, 16 Oct 2024 18:19:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30492C78032
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:18:58 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GDCXBb005336;
 Wed, 16 Oct 2024 20:18:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +PxEzDAXe02bNGcY/2st1+YkLtJzg7NCqVd0Yfp3W5U=; b=a714+TX4mb+PGY5M
 CWNGysJT3IP1WCrs1u0Wal7NbOA4IMf3daO12OG/75iZVhsXCUqXJLLOvT3R9HoY
 zn45Zy7pqzUoni0lMdaZqyCNMEbZt0smkDUWDXb2rquCcGd+Dxvp1w5hHZNHAR48
 ldaSfODghd3a18wBPq5L7mKIvTjeS91NoXgOPB+3VCq/pEoBOC+5Ob8LGcxkN0Ke
 cJdaSloX61VkSo8Wq7W3IceoAunoteB7JGlXVWoettyWH1uj6ei+BHHk2DVP5NXV
 XLjm0zzFzyWo/eeHdR37ule5w7spOJ5flvAlJTK226rHZBqw3CKu1TNrU9SwdOZY
 K84FfA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 427ehgcnbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 20:18:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1B0774007C;
 Wed, 16 Oct 2024 20:17:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D922A263876;
 Wed, 16 Oct 2024 20:15:12 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 20:15:12 +0200
Message-ID: <4c5e694c-a541-42ee-8bea-26dc3f9d2737@foss.st.com>
Date: Wed, 16 Oct 2024 20:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241005011647.436456-1-marex@denx.de>
 <20241005011647.436456-2-marex@denx.de>
 <1d544619-8155-4254-83ff-7c88468f738f@foss.st.com>
Content-Language: en-US
In-Reply-To: <1d544619-8155-4254-83ff-7c88468f738f@foss.st.com>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] ARM: dts: stm32: Switch to using
 upstream DT on DH STM32 DHSOM
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

SGksCgpPbiAxMC8xMS8yNCAxOTo1NCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPgo+
IE9uIDEwLzUvMjQgMDM6MTUsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBFbmFibGUgT0ZfVVBTVFJF
QU0gdG8gdXNlIHVwc3RyZWFtIERUIGFuZCBhZGQgc3QvIHByZWZpeCB0byB0aGUKPj4gREVGQVVM
VF9ERVZJQ0VfVFJFRS4gQW5kIHRoZXJlYnkgZGlyZWN0bHkgYnVpbGQgRFRCIGZyb20gCj4+IGR0
cy91cHN0cmVhbS9zcmMvCj4+IGluY2x1ZGluZyAqLXUtYm9vdC5kdHNpIGZyb20gYXJjaC8kKEFS
Q0gpL2R0cy8gZGlyZWN0b3J5Lgo+Pgo+PiBUaGUgcHJldmlvdXMgc2V0dXAgdXNlZCBnZW5lcmlj
IFNvQyBwcmVmaXggbGlrZSBzdG0zMm1wMTV4eC1kaGNvKiBmb3IKPj4gZ2VuZXJpYyBEVHMgd2hp
Y2ggY291bGQgYmUgdXNlZCBvbiBhbnkgU1RNMzJNUDE1eHggREhTT00gdmFyaWFudC4gVGhlCj4+
IG5ldyBzZXR1cCB1c2VzIHNwZWNpZmljIFNvQyBwcmVmaXggc3RtMzJtcDE1N2MtZGhjbyogdG8g
bWF0Y2ggTGludXggRFQKPj4gbmFtZXMuIFNpbmNlIHRoZSBoYXJkd2FyZSBwcmVzZW50IG9uIFNU
TTMyTVAxNTMgYW5kIFNUTTMyTVAxNTcgaXMgbm90Cj4+IGVuYWJsZWQgaW4gdGhlIGJvYXJkIGNv
bmZpZ3VyYXRpb24gYW5kIG5vdCBzdXBwb3J0ZWQgYnkgVS1Cb290IGV4Y2VwdAo+PiBmb3IgdGhl
IERTSSBob3N0LCB1c2luZyB0aGUgZXhpc3RpbmcgTGludXggRFRzIHBvc2VzIG5vIGlzc3VlIGV2
ZW4gb24KPj4gcGxhaW4gU1RNMzJNUDE1MUEgYmFzZWQgU29Ncy4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+IC0tLQo+PiBDYzogUGF0cmljZSBDaG90
YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IENjOiBQYXRyaWNrIERlbGF1bmF5
IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiBDYzogU2VhbiBBbmRlcnNvbiA8c2Vh
bmdhMkBnbWFpbC5jb20+Cj4+IENjOiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4KPj4g
Q2M6IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+Cj4+IENjOiB1LWJvb3RAZGgtZWxlY3Ry
b25pY3MuY29tCj4+IENjOiB1LWJvb3RAbGlzdHMuZGVueC5kZQo+PiBDYzogdWJvb3Qtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+PiAtLS0KPj4gVjI6IC0gRHJvcCBhcmNoL2Fy
bS9kdHMvTWFrZWZpbGUgZW50cmllcwo+PiDCoMKgwqDCoCAtIENvbnZlcnQgc3RtMzJtcDEzNWYt
ZGhjb20tZGhzYmMKPj4gLS0tCj4+IMKgIGFyY2gvYXJtL2R0cy9NYWtlZmlsZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA5ICstCj4+IMKgIGFy
Y2gvYXJtL2R0cy9zdG0zMm1wMTM1Zi1kaGNvci1kaHNiYy5kdHPCoMKgwqDCoMKgIHwgMzgzIC0t
LS0tLS0tLS0tLQo+PiDCoCAuLi4+IHN0bTMybXAxNTFhLWRoY29yLXRlc3RiZW5jaC11LWJvb3Qu
ZHRzaX0gfMKgwqAgMAo+PiDCoCAuLi5zaSA9PiBzdG0zMm1wMTUzYy1kaGNvbS1kcmMwMi11LWJv
b3QuZHRzaX0gfMKgwqAgMAo+PiDCoCAuLi5zdG0zMm1wMTUzYy1kaGNvci1kcmMtY29tcGFjdC11
LWJvb3QuZHRzaX0gfMKgwqAgMAo+PiDCoCAuLi4+IHN0bTMybXAxNTdhLWRoY29yLWF2ZW5nZXI5
Ni11LWJvb3QuZHRzaX0gfMKgwqAgMAo+PiDCoCAuLi50c2kgPT4gc3RtMzJtcDE1N2MtZGhjb20t
cGRrMi11LWJvb3QuZHRzaX0gfMKgwqAgMAo+PiDCoCAuLi4gPT4gc3RtMzJtcDE1N2MtZGhjb20t
cGljb2l0eC11LWJvb3QuZHRzaX0gfMKgwqAgMAo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1
eHgtZGhjb20tZHJjMDIuZHRzwqDCoMKgwqDCoCB8wqAgMTcgLQo+PiDCoCBhcmNoL2FybS9kdHMv
c3RtMzJtcDE1eHgtZGhjb20tZHJjMDIuZHRzacKgwqDCoMKgIHwgMTY5IC0tLS0tLQo+PiDCoCBh
cmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGRrMi5kdHPCoMKgwqDCoMKgwqAgfMKgIDE3
IC0KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29tLXBkazIuZHRzacKgwqDCoMKg
wqAgfCAzMjkgLS0tLS0tLS0tLS0KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29t
LXBpY29pdHguZHRzwqDCoMKgIHzCoCAxNyAtCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTV4
eC1kaGNvbS1waWNvaXR4LmR0c2nCoMKgIHwgMTUxIC0tLS0tCj4+IMKgIGFyY2gvYXJtL2R0cy9z
dG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzacKgwqDCoMKgwqDCoCB8IDU0NCAtLS0tLS0tLS0tLS0t
LS0tLS0KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHPC
oCB8wqAgMjAgLQo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItYXZlbmdlcjk2
LmR0c2kgfCA0MzcgLS0tLS0tLS0tLS0tLS0KPj4gwqAgLi4uL2FybS9kdHMvc3RtMzJtcDE1eHgt
ZGhjb3ItZHJjLWNvbXBhY3QuZHRzIHzCoCAxOCAtCj4+IMKgIC4uLi9kdHMvc3RtMzJtcDE1eHgt
ZGhjb3ItZHJjLWNvbXBhY3QuZHRzacKgwqDCoCB8IDMyNiAtLS0tLS0tLS0tLQo+PiDCoCBhcmNo
L2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItaW8xdjguZHRzacKgwqDCoMKgIHzCoCAyOCAtCj4+
IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvci1zb20uZHRzacKgwqDCoMKgwqDCoCB8
IDIyMSAtLS0tLS0tCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvci10ZXN0YmVu
Y2guZHRzwqAgfCAxODAgLS0tLS0tCj4+IMKgIC4uLi9kaF9zdG0zMm1wMS91LWJvb3QtZGhjb20u
aXRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDE4ICstCj4+IMKgIC4uLi9kaF9zdG0z
Mm1wMS91LWJvb3QtZGhjb3IuaXRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEyICst
Cj4+IMKgIGNvbmZpZ3Mvc3RtMzJtcDEzX2RoY29yX2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCAzICstCj4+IMKgIGNvbmZpZ3Mvc3RtMzJtcDE1X2RoY29tX2Jhc2ljX2Rl
ZmNvbmZpZ8KgwqDCoMKgwqDCoCB8wqDCoCA1ICstCj4+IMKgIGNvbmZpZ3Mvc3RtMzJtcDE1X2Ro
Y29yX2Jhc2ljX2RlZmNvbmZpZ8KgwqDCoMKgwqDCoCB8wqDCoCA1ICstCj4+IMKgIDI3IGZpbGVz
IGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDI4ODUgZGVsZXRpb25zKC0pCj4+IMKgIGRlbGV0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMuZHRzCj4+
IMKgIHJlbmFtZSBhcmNoL2FybS9kdHMve3N0bTMybXAxNXh4LWRoY29yLXRlc3RiZW5jaC11LWJv
b3QuZHRzaSA9PiAKPj4gc3RtMzJtcDE1MWEtZGhjb3ItdGVzdGJlbmNoLXUtYm9vdC5kdHNpfSAo
MTAwJSkKPj4gwqAgcmVuYW1lIGFyY2gvYXJtL2R0cy97c3RtMzJtcDE1eHgtZGhjb20tZHJjMDIt
dS1ib290LmR0c2kgPT4gCj4+IHN0bTMybXAxNTNjLWRoY29tLWRyYzAyLXUtYm9vdC5kdHNpfSAo
MTAwJSkKPj4gwqAgcmVuYW1lIGFyY2gvYXJtL2R0cy97c3RtMzJtcDE1eHgtZGhjb3ItZHJjLWNv
bXBhY3QtdS1ib290LmR0c2kgPT4gCj4+IHN0bTMybXAxNTNjLWRoY29yLWRyYy1jb21wYWN0LXUt
Ym9vdC5kdHNpfSAoMTAwJSkKPj4gwqAgcmVuYW1lIGFyY2gvYXJtL2R0cy97c3RtMzJtcDE1eHgt
ZGhjb3ItYXZlbmdlcjk2LXUtYm9vdC5kdHNpID0+IAo+PiBzdG0zMm1wMTU3YS1kaGNvci1hdmVu
Z2VyOTYtdS1ib290LmR0c2l9ICgxMDAlKQo+PiDCoCByZW5hbWUgYXJjaC9hcm0vZHRzL3tzdG0z
Mm1wMTV4eC1kaGNvbS1wZGsyLXUtYm9vdC5kdHNpID0+IAo+PiBzdG0zMm1wMTU3Yy1kaGNvbS1w
ZGsyLXUtYm9vdC5kdHNpfSAoMTAwJSkKPj4gwqAgcmVuYW1lIGFyY2gvYXJtL2R0cy97c3RtMzJt
cDE1eHgtZGhjb20tcGljb2l0eC11LWJvb3QuZHRzaSA9PiAKPj4gc3RtMzJtcDE1N2MtZGhjb20t
cGljb2l0eC11LWJvb3QuZHRzaX0gKDEwMCUpCj4+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20tZHJjMDIuZHRzCj4+IMKgIGRlbGV0ZSBtb2RlIDEw
MDY0NCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20tZHJjMDIuZHRzaQo+PiDCoCBkZWxl
dGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29tLXBkazIuZHRzCj4+
IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGRr
Mi5kdHNpCj4+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgt
ZGhjb20tcGljb2l0eC5kdHMKPj4gwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9z
dG0zMm1wMTV4eC1kaGNvbS1waWNvaXR4LmR0c2kKPj4gwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaQo+PiDCoCBkZWxldGUgbW9kZSAx
MDA2NDQgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHMKPj4gwqAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2Vy
OTYuZHRzaQo+PiDCoCBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4
LWRoY29yLWRyYy1jb21wYWN0LmR0cwo+PiDCoCBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0v
ZHRzL3N0bTMybXAxNXh4LWRoY29yLWRyYy1jb21wYWN0LmR0c2kKPj4gwqAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGFyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvci1pbzF2OC5kdHNpCj4+IMKgIGRl
bGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb3Itc29tLmR0c2kK
Pj4gwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvci10
ZXN0YmVuY2guZHRzCj4+Cj4KPiBOaWNlLgo+Cj4KPgo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERl
bGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+Cj4gVGhhbmtzCj4gUGF0cmlj
awo+CgpBcHBsaWVkIHRvIHUtYm9vdC1zdG0vbWFzdGVyLCB0aGFua3MhCgpSZWdhcmRzClBhdHJp
Y2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==
