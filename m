Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD8908B2A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 13:59:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDF5DC6B460;
	Fri, 14 Jun 2024 11:59:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5EA6C5E2CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 11:59:43 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EAXuR0026966;
 Fri, 14 Jun 2024 13:59:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 xPGDTRvydhk7eDFDbiBK8koZCah5XjM60dYlNUeUoAA=; b=0Y/zQhV0STj+73Fq
 bHu5boK4ttHoP6MTwNsrw7ZlfLVM5FDcairzdcvSAfqlWiKqeL2ADJdK1wYVdYkD
 FQG+cq2968RNoNyuMdVxhu2ZJoIKXGvXqhhEJfYTGb1EdiSHy2G08Pydy+lt4l87
 iMYHng8ny+vV7mKDwldUva1zv8zml0GhyuWApcLhKD4+lt1du/E0DwFUHvq1/+WY
 i0SrK5QP1FXkYaFmy13AciRgsnPqCVad9SoCPVzX1qYvGgWB7xmiNbJUHihapYj7
 GjWLy6830X20xzf8BptPoObh+07SUwlrKyUmLql2Z1nNcVrhonjB78kk65TLbloL
 ClJSRg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yrfuj9muv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 13:59:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EC1C940045;
 Fri, 14 Jun 2024 13:59:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA68F2132EF;
 Fri, 14 Jun 2024 13:58:59 +0200 (CEST)
Received: from [10.252.18.60] (10.252.18.60) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 13:58:59 +0200
Message-ID: <89e7aad8-705a-4edd-be6b-fa8383b684ab@foss.st.com>
Date: Fri, 14 Jun 2024 13:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Igor Opaniuk <igor.opaniuk@foundries.io>, Marek Vasut <marex@denx.de>
References: <20240419220331.277574-1-marex@denx.de>
 <CAL6CDMHFDhcUXhz5+w92SqKa0jC1TNPEiyvRS=jZ4CBqTm7=PA@mail.gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAL6CDMHFDhcUXhz5+w92SqKa0jC1TNPEiyvRS=jZ4CBqTm7=PA@mail.gmail.com>
X-Originating-IP: [10.252.18.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_09,2024-06-14_03,2024-05-17_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Ping IWDG on exit from PSCI
	suspend code
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

CgpPbiA2LzEwLzI0IDEwOjM2LCBJZ29yIE9wYW5pdWsgd3JvdGU6Cj4gT24gU2F0LCBBcHIgMjAs
IDIwMjQgYXQgMTI6MDPigK9BTSBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGU6Cj4+
Cj4+IE1ha2Ugc3VyZSB0aGUgT1Mgd291bGQgbm90IGdldCBhbnkgc3B1cmlvdXMgSVdERyBwcmV0
aW1lb3V0IElSUQo+PiByaWdodCBhZnRlciB0aGUgc3lzdGVtIHdha2VzIHVwLiBUaGlzIG1heSBo
YXBwZW4gaW4gY2FzZSB0aGUgU29DCj4+IGdvdCB3b2tlbiB1cCBieSBhbm90aGVyIHNvdXJjZSB0
aGFuIHRoZSBJV0RHIHByZXRpbWVvdXQgYW5kIHRoZQo+PiBwcmV0aW1lb3V0IElSUSBhcnJpdmVk
IGltbWVkaWF0ZWx5IGFmdGVyd2FyZCwgYnV0IHRvbyBsYXRlIHRvIGJlCj4+IGhhbmRsZWQgYnkg
dGhlIHN1c3BlbmQgbWFpbiBsb29wLiBJbiBjYXNlIGVpdGhlciBvZiB0aGUgSVdERyBpcwo+PiBl
bmFibGVkLCBwaW5nIGl0IGZpcnN0IGFuZCB0aGVuIHJldHVybiB0byB0aGUgT1MuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiAtLS0KPj4gQ2M6IEln
b3IgT3Bhbml1ayA8aWdvci5vcGFuaXVrQGZvdW5kcmllcy5pbz4KPj4gQ2M6IFBhdHJpY2UgQ2hv
dGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBDYzogUGF0cmljayBEZWxhdW5h
eSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gQ2M6IFNpbW9uIEdsYXNzIDxzamdA
Y2hyb21pdW0ub3JnPgo+PiBDYzogVG9tIFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4KPj4gQ2M6
IHUtYm9vdEBkaC1lbGVjdHJvbmljcy5jb20KPj4gQ2M6IHVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KPj4gLS0tCj4+ICBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJt
cDEvcHNjaS5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L3N0bTMybXAxL3BzY2kuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9wc2NpLmMK
Pj4gaW5kZXggNGYyMzc5ZGY0NWYuLmU5OTEwMzkxMGQ5IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2Fy
bS9tYWNoLXN0bTMybXAvc3RtMzJtcDEvcHNjaS5jCj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3Rt
MzJtcC9zdG0zMm1wMS9wc2NpLmMKPj4gQEAgLTgwOCw2ICs4MDgsMjcgQEAgdm9pZCBfX3NlY3Vy
ZSBwc2NpX3N5c3RlbV9zdXNwZW5kKHUzMiBfX2Fsd2F5c191bnVzZWQgZnVuY3Rpb25faWQsCj4+
ICAgICAgICAgd3JpdGVsKFNZU0NGR19DTVBFTlJfTVBVRU4sIFNUTTMyX1NZU0NGR19CQVNFICsg
U1lTQ0ZHX0NNUEVOU0VUUik7Cj4+ICAgICAgICAgY2xyYml0c19sZTMyKFNUTTMyX1NZU0NGR19C
QVNFICsgU1lTQ0ZHX0NNUENSLCBTWVNDRkdfQ01QQ1JfU1dfQ1RSTCk7Cj4+Cj4+ICsgICAgICAg
LyoKPj4gKyAgICAgICAgKiBNYWtlIHN1cmUgdGhlIE9TIHdvdWxkIG5vdCBnZXQgYW55IHNwdXJp
b3VzIElXREcgcHJldGltZW91dCBJUlEKPj4gKyAgICAgICAgKiByaWdodCBhZnRlciB0aGUgc3lz
dGVtIHdha2VzIHVwLiBUaGlzIG1heSBoYXBwZW4gaW4gY2FzZSB0aGUgU29DCj4+ICsgICAgICAg
ICogZ290IHdva2VuIHVwIGJ5IGFub3RoZXIgc291cmNlIHRoYW4gdGhlIElXREcgcHJldGltZW91
dCBhbmQgdGhlCj4+ICsgICAgICAgICogcHJldGltZW91dCBJUlEgYXJyaXZlZCBpbW1lZGlhdGVs
eSBhZnRlcndhcmQsIGJ1dCB0b28gbGF0ZSB0byBiZQo+PiArICAgICAgICAqIGhhbmRsZWQgYnkg
dGhlIG1haW4gbG9vcCBhYm92ZS4gSW4gY2FzZSBlaXRoZXIgb2YgdGhlIElXREcgaXMKPj4gKyAg
ICAgICAgKiBlbmFibGVkLCBwaW5nIGl0IGZpcnN0IGFuZCB0aGVuIHJldHVybiB0byB0aGUgT1Mu
Cj4+ICsgICAgICAgICovCj4+ICsKPj4gKyAgICAgICAvKiBQaW5nIElXREcxIGFuZCBBQ0sgcHJl
dGltZXIgSVJRICovCj4+ICsgICAgICAgaWYgKGdpY19lbmFibGVkWzRdICYgQklUKDIyKSkgewo+
PiArICAgICAgICAgICAgICAgd3JpdGVsKElXREdfS1JfUkVMT0FEX0tFWSwgU1RNMzJfSVdERzFf
QkFTRSArIElXREdfS1IpOwo+PiArICAgICAgICAgICAgICAgd3JpdGVsKElXREdfRVdDUl9FV0lD
LCBTVE0zMl9JV0RHMV9CQVNFICsgSVdER19FV0NSKTsKPj4gKyAgICAgICB9Cj4+ICsKPj4gKyAg
ICAgICAvKiBQaW5nIElXREcyIGFuZCBBQ0sgcHJldGltZXIgSVJRICovCj4+ICsgICAgICAgaWYg
KGdpY19lbmFibGVkWzRdICYgQklUKDIzKSkgewo+PiArICAgICAgICAgICAgICAgd3JpdGVsKElX
REdfS1JfUkVMT0FEX0tFWSwgU1RNMzJfSVdERzJfQkFTRSArIElXREdfS1IpOwo+PiArICAgICAg
ICAgICAgICAgd3JpdGVsKElXREdfRVdDUl9FV0lDLCBTVE0zMl9JV0RHMl9CQVNFICsgSVdER19F
V0NSKTsKPj4gKyAgICAgICB9Cj4+ICsKPj4gICAgICAgICAvKgo+PiAgICAgICAgICAqIFRoZSBz
eXN0ZW0gaGFzIHJlc3VtZWQgc3VjY2Vzc2Z1bGx5LiBSZXdyaXRlIExSIHJlZ2lzdGVyIHN0b3Jl
ZAo+PiAgICAgICAgICAqIG9uIHN0YWNrIHdpdGggJ2VwJyB2YWx1ZSwgc28gdGhhdCBvbiByZXR1
cm4gZnJvbSB0aGlzIFBTQ0kgY2FsbCwKPj4gLS0KPj4gMi40My4wCj4+Cj4gCj4gUmV2aWV3ZWQt
Ynk6IElnb3IgT3Bhbml1ayA8aWdvci5vcGFuaXVrQGZvdW5kcmllcy5pbz4KPiAKQXBwbGllZCB0
byB1LWJvb3Qtc3RtMzIvbmV4dAoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
