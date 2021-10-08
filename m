Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 233A34264DE
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 08:46:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB69BC597B2;
	Fri,  8 Oct 2021 06:46:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51A8EC57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 06:46:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZJjN020838; 
 Fri, 8 Oct 2021 08:46:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UeTvB/3mA8Mhvuu3QEmdFz/aogDvo2om4EFRTfkvf7Y=;
 b=Gz5s8qSF4zes8Lh/tkCIALhvxiogVR1g0fER6ZAOKpiwENWzs9WTDBY4Iw3BCDaFuDmF
 /BzAcMKtFVgBxPsd2WE2TB+WRTHCtcS4it8VIGNtHiFnj2BKY2KMz63x7y/hAH+lqkie
 HMwwBboEyiNw/7RC1Pv/5ozm39+56CPkvoc+0aYRM1Nzo+YL4gE/BcTygaCBVyrr5xWJ
 uLVU3PFxHyOav2PJ7LpY/er3uFSSHOAG5Vam8r3iAmAUk88OtDjUi0I+Ylrpu1vZ/8Tv
 lXUXULTO0308vjln+0/Fe65KFKgnN9/84CA2ShSVpHjv5prDeHIIZa6w2wuiyqdxN2Ar 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjbjshqxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:46:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C641100034;
 Fri,  8 Oct 2021 08:46:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13CBF214D37;
 Fri,  8 Oct 2021 08:46:55 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:46:54 +0200
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210901095143.4143-1-patrice.chotard@foss.st.com>
 <20210901095143.4143-2-patrice.chotard@foss.st.com>
 <5e6e9e55-25bc-66e0-4691-481be727f670@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <62fc0c30-7da1-fe78-050b-4ff743d0da38@foss.st.com>
Date: Fri, 8 Oct 2021 08:46:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5e6e9e55-25bc-66e0-4691-481be727f670@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>
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

SGkKCk9uIDkvMy8yMSAxMDozMSBBTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSBQYXRy
aWNlLAo+IAo+IE9uIDkvMS8yMSAxMTo1MSBBTSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBE
TV9HUElPX0hPRyBmbGFnIGhhcyBiZWVuIHJlcGxhY2VkIGJ5IEdQSU9fSE9HIGZsYWcgc2luY2Ug
YSB3aGlsZSBpbgo+PiBjb21taXQgNDliMTBjYjQ5MjYyICgiZ3BpbzogZml4ZXMgZm9yIGdwaW8t
aG9nIHN1cHBvcnQiKS4KPj4KPj4gQW5kIGZ1cnRoZXJtb3JlLCBncGlvX2hvZ19wcm9iZV9hbGwo
KSBpcyBhbHJlYWR5IGNhbGxlZCBpbiBib2FyZF9yLmMuCj4+IFNvIGdwaW9faG9nX3Byb2JlKCkg
Y2FuIGJlIHJlbW92ZWQgZnJvbSBzdG0zMm1wMS5jLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRy
aWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gQ2M6IE1hcmVrIFZh
c3V0IDxtYXJleEBkZW54LmRlPgo+PiAtLS0KPj4KPj4gwqAgYm9hcmQvZGhlbGVjdHJvbmljcy9k
aF9zdG0zMm1wMS9ib2FyZC5jIHwgMyAtLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9ib2FyZC9kaGVsZWN0cm9uaWNzL2RoX3N0bTMybXAx
L2JvYXJkLmMgYi9ib2FyZC9kaGVsZWN0cm9uaWNzL2RoX3N0bTMybXAxL2JvYXJkLmMKPj4gaW5k
ZXggZDdjMTg1N2MxNi4uNzI1YjQzOGQ3NiAxMDA2NDQKPj4gLS0tIGEvYm9hcmQvZGhlbGVjdHJv
bmljcy9kaF9zdG0zMm1wMS9ib2FyZC5jCj4+ICsrKyBiL2JvYXJkL2RoZWxlY3Ryb25pY3MvZGhf
c3RtMzJtcDEvYm9hcmQuYwo+PiBAQCAtNTkzLDkgKzU5Myw2IEBAIGludCBib2FyZF9pbml0KHZv
aWQpCj4+IMKgwqDCoMKgwqAgLyogYWRkcmVzcyBvZiBib290IHBhcmFtZXRlcnMgKi8KPj4gwqDC
oMKgwqDCoCBnZC0+YmQtPmJpX2Jvb3RfcGFyYW1zID0gU1RNMzJfRERSX0JBU0UgKyAweDEwMDsK
Pj4gwqAgLcKgwqDCoCBpZiAoQ09ORklHX0lTX0VOQUJMRUQoRE1fR1BJT19IT0cpKQo+PiAtwqDC
oMKgwqDCoMKgwqAgZ3Bpb19ob2dfcHJvYmVfYWxsKCk7Cj4+IC0KPj4gwqDCoMKgwqDCoCBib2Fy
ZF9rZXlfY2hlY2soKTsKPj4gwqAgwqAgI2lmZGVmIENPTkZJR19ETV9SRUdVTEFUT1IKPiAKPiAK
PiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0
LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQgb24gdS1ib290LXN0bTMyIGZv
ciBuZXh0ClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
