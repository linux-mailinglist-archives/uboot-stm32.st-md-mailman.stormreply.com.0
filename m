Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D7D66791C
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:24:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8026EC69049;
	Thu, 12 Jan 2023 15:24:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E03CC69048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:24:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CBKtBR003671; Thu, 12 Jan 2023 16:24:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RHb49m7eH7OjYIifFT2LVj+2jB18nVl63STOE1vZ1JY=;
 b=szPsPMxKaCSXhLgQg78fOQuVTwMASY97b2dPPO9rQaJX1NvcKQg9dRb7i8EFWeQQ/uvC
 NFaYVjWTM160QvdJl8YjH+2P9oIctLjxXXBZrhqbzLN4Ig2B31PJAlkuVwwMtnD0hGxZ
 IGmd+t3HTww+t/CUhalAf0sTr0uDv2tDVSXuga5NYv5m7ELAfikki3MWd435WwiBS2o6
 QMHT8HLDnbaCFMSMEEsb7i1YTnCOGlU5CZXzMnVQ/HJM+Sjkl2yT4pBpXW0iKu/Svskx
 TmagP3y+qO+HBxrGaGac+49wOf+VdW55sWOiMDY1xhtH7siI1YBCLEnLqqavg9cSO1zL Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1k64kvut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 16:24:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BF1110002A;
 Thu, 12 Jan 2023 16:24:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 957CF21B518;
 Thu, 12 Jan 2023 16:24:30 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 16:24:29 +0100
Message-ID: <ddf2dde7-683e-8329-ee46-9c2e83d757f2@foss.st.com>
Date: Thu, 12 Jan 2023 16:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
 <20221212104437.15838-2-fabrice.gasnier@foss.st.com>
 <530438bb-c270-f36b-025e-5d3d3f335fc3@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <530438bb-c270-f36b-025e-5d3d3f335fc3@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Sean Anderson <sean.anderson@seco.com>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/3] usb: onboard-hub: add driver to
 manage onboard hub supplies
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

SGkgRmFicmljZQoKT24gMS8zLzIzIDE3OjM0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhp
LAo+IAo+IE9uIDEyLzEyLzIyIDExOjQ0LCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4+IFRoZSBt
YWluIGlzc3VlIHRoZSBkcml2ZXIgYWRkcmVzc2VzIGlzIHRoYXQgYSBVU0IgaHViIG5lZWRzIHRv
IGJlCj4+IHBvd2VyZWQgYmVmb3JlIGl0IGNhbiBiZSBkaXNjb3ZlcmVkLiBUaGlzIGlzIG9mdGVu
IHNvbHZlZCBieSB1c2luZwo+PiAicmVndWxhdG9yLWFsd2F5cy1vbiIuCj4+Cj4+IFRoaXMgZHJp
dmVyIGlzIGluc3BpcmVkIGJ5IHRoZSBMaW51eCB2Ni4xIGRyaXZlci4gSXQgb25seSBlbmFibGVz
IChvcgo+PiBkaXNhYmxlcykgdGhlIGh1YiB2ZGQgKDN2Mykgc3VwcGx5LCBzbyBpdCBjYW4gYmUg
ZW51bWVyYXRlZC4KPj4gU2Nhbm5pbmcgb2YgdGhlIGRldmljZSB0cmVlIGlzIGRvbmUgaW4gYSBz
aW1pbGFyIG1hbm5lciB0byB0aGUgc2FuZGJveCwKPj4gYnkgdGhlIHVzYi11Y2xhc3MuIERUIHBh
cnQgbG9va3MgbGlrZToKPj4KPj4gJnVzYmhfZWhjaSB7Cj4+IMKgwqDCoMKgLi4uCj4+IMKgwqDC
oMKgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+IMKgwqDCoMKgI3NpemUtY2VsbHMgPSA8MD47Cj4+
IMKgwqDCoMKgaHViQDEgewo+PiDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInVzYjQyNCwy
NTE0IjsKPj4gwqDCoMKgwqDCoMKgwqAgcmVnID0gPDE+Owo+PiDCoMKgwqDCoMKgwqDCoCB2ZGQt
c3VwcGx5ID0gPCZ2M3YzPjsKPj4gwqDCoMKgwqB9Owo+PiB9Owo+Pgo+PiBXaGVuIHRoZSBidXMg
Z2V0cyBwcm9iZWQsIHRoZSBkcml2ZXIgaXMgYXV0b21hdGljYWxseSBwcm9iZWQvcmVtb3ZlZCBm
cm9tCj4+IHRoZSBidXMgdHJlZSwgYXMgYW4gZXhhbXBsZSBvbiBzdG0zMjoKPj4gU1RNMzJNUD4g
dXNiIHN0YXJ0Cj4+IHN0YXJ0aW5nIFVTQi4uLgo+PiBTVE0zMk1QPiBkbSB0cmVlCj4+IMKgIENs
YXNzwqDCoMKgwqAgSW5kZXjCoCBQcm9iZWTCoCBEcml2ZXLCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgTmFtZQo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCB1c2LCoMKgwqDCoMKgwqDCoMKgwqDCoCAwwqAgWyAr
IF3CoMKgIGVoY2lfZ2VuZXJpY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCB8LS0gdXNiQDU4MDBk
MDAwCj4+IMKgIHVzYl9odWLCoMKgwqDCoMKgwqAgMMKgIFsgKyBdwqDCoCB1c2Jfb25ib2FyZF9o
dWLCoMKgwqDCoMKgwqAgfMKgwqAgfMKgwqAgYC0tIGh1YkAxCj4+IMKgIHVzYl9odWLCoMKgwqDC
oMKgwqAgMcKgIFsgKyBdwqDCoCB1c2JfaHViwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCB8wqDCoMKgwqDCoMKgIGAtLSB1c2JfaHViCj4+Cj4+IFNUTTMyTVA+IHVzYiB0cmVlCj4+
IFVTQiBkZXZpY2UgdHJlZToKPj4gwqDCoCAxwqAgSHViICg0ODAgTWIvcywgMG1BKQo+PiDCoMKg
IHzCoCB1LWJvb3QgRUhDSSBIb3N0IENvbnRyb2xsZXIKPj4gwqDCoCB8Cj4+IMKgwqAgKy0ywqAg
SHViICg0ODAgTWIvcywgMm1BKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEdhc25pZXIg
PGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGNvbW1vbi9NYWtl
ZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+PiDCoCBjb21tb24vdXNi
X29uYm9hcmRfaHViLmPCoMKgwqDCoMKgIHwgNjIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4gwqAgZHJpdmVycy91c2IvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MTAgKysrKysrCj4+IMKgIGRyaXZlcnMvdXNiL2hvc3QvdXNiLXVjbGFzcy5jIHwgMTYgKysrKyst
LS0tCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgODMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbW1vbi91c2Jfb25ib2FyZF9odWIuYwo+Pgo+
IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Mu
c3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKPiAKCkFwcGxpZWQgb24gdS1ib290LXN0
bTMyL21hc3RlcgoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
