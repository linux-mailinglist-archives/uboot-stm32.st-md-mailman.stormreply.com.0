Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A08D4264DF
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 08:47:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20B45C597B2;
	Fri,  8 Oct 2021 06:47:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D9E1C57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 06:47:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZdJ7022582; 
 Fri, 8 Oct 2021 08:47:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RUBi00+msdFJcUXXd2yRojWEfwG+8UmlxDWL2SS0Xg8=;
 b=A36CTUVLfRF2VyKL75ymlB0aHGL2od9SOmAmJTppgjRx+kE9mTDcftZBHSbtCXjFR4ne
 d0yyZu7wQzvZBrBoLhn/3sOQ8qruyLDaLaXiQcR7z4SjjXPVgG8l3qh7rm0s/CeWMiR8
 z1fnISH8uyiZWWfJk4H6VF0LQOM7s1SKCuoTD65csRfOnnD/kSbIqlqT7Vmg+MmdbH7E
 nJ/QHn1Rf1+B5EejJsZIkIt63JTX9esXmTyW6fwXnBzeDvq0jOI/GSQfiUDiEEYytSlE
 89cHVO/9GYEPM+LN4bl2DdI0staz9C2OW05TEEOxBZ0t5c/3KFAjaQg3oRIefvtnv9NX yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjbjshr0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:47:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 186E7100038;
 Fri,  8 Oct 2021 08:47:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 100AC214D37;
 Fri,  8 Oct 2021 08:47:07 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:47:06 +0200
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20210901095143.4143-1-patrice.chotard@foss.st.com>
 <20210901095143.4143-2-patrice.chotard@foss.st.com>
 <1c71e380-0472-d5d1-aae9-4ac3b31f59f4@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <b0e758ff-c6d2-1a22-21d1-8715b1e221c1@foss.st.com>
Date: Fri, 8 Oct 2021 08:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1c71e380-0472-d5d1-aae9-4ac3b31f59f4@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: dh_stm32mp1: Remove
 gpio_hog_probe_all() from board
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

SGkKCk9uIDkvMy8yMSAzOjAyIFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA5LzEvMjEgMTE6
NTEgQU0sIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRE1fR1BJT19IT0cgZmxhZyBoYXMgYmVl
biByZXBsYWNlZCBieSBHUElPX0hPRyBmbGFnIHNpbmNlIGEgd2hpbGUgaW4KPj4gY29tbWl0IDQ5
YjEwY2I0OTI2MiAoImdwaW86IGZpeGVzIGZvciBncGlvLWhvZyBzdXBwb3J0IikuCj4+Cj4+IEFu
ZCBmdXJ0aGVybW9yZSwgZ3Bpb19ob2dfcHJvYmVfYWxsKCkgaXMgYWxyZWFkeSBjYWxsZWQgaW4g
Ym9hcmRfci5jLgo+PiBTbyBncGlvX2hvZ19wcm9iZSgpIGNhbiBiZSByZW1vdmVkIGZyb20gc3Rt
MzJtcDEuYy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAZm9zcy5zdC5jb20+Cj4+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4g
LS0tCj4+Cj4+IMKgIGJvYXJkL2RoZWxlY3Ryb25pY3MvZGhfc3RtMzJtcDEvYm9hcmQuYyB8IDMg
LS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYm9hcmQvZGhlbGVjdHJvbmljcy9kaF9zdG0zMm1wMS9ib2FyZC5jIGIvYm9hcmQvZGhlbGVj
dHJvbmljcy9kaF9zdG0zMm1wMS9ib2FyZC5jCj4+IGluZGV4IGQ3YzE4NTdjMTYuLjcyNWI0Mzhk
NzYgMTAwNjQ0Cj4+IC0tLSBhL2JvYXJkL2RoZWxlY3Ryb25pY3MvZGhfc3RtMzJtcDEvYm9hcmQu
Ywo+PiArKysgYi9ib2FyZC9kaGVsZWN0cm9uaWNzL2RoX3N0bTMybXAxL2JvYXJkLmMKPj4gQEAg
LTU5Myw5ICs1OTMsNiBAQCBpbnQgYm9hcmRfaW5pdCh2b2lkKQo+PiDCoMKgwqDCoMKgIC8qIGFk
ZHJlc3Mgb2YgYm9vdCBwYXJhbWV0ZXJzICovCj4+IMKgwqDCoMKgwqAgZ2QtPmJkLT5iaV9ib290
X3BhcmFtcyA9IFNUTTMyX0REUl9CQVNFICsgMHgxMDA7Cj4+IMKgIC3CoMKgwqAgaWYgKENPTkZJ
R19JU19FTkFCTEVEKERNX0dQSU9fSE9HKSkKPj4gLcKgwqDCoMKgwqDCoMKgIGdwaW9faG9nX3By
b2JlX2FsbCgpOwo+PiAtCj4+IMKgwqDCoMKgwqAgYm9hcmRfa2V5X2NoZWNrKCk7Cj4gCj4gVGhp
cyBpcyBsaWtlbHkgT0ssIHllcy4KCkFwcGxpZWQgb24gdS1ib290LXN0bTMyIGZvciBuZXh0ClRo
YW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
