Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A58B43D0AF0
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Jul 2021 11:06:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD94BC597BD;
	Wed, 21 Jul 2021 09:06:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37A47C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 09:06:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16L934Fq021785; Wed, 21 Jul 2021 11:05:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LLuQToHYfhuSM1QNV7bOYua6mnpMpziGw5IlbvaOmag=;
 b=8Pyyga5Vd0e7bLkPXK/JnqU6CKt74CAUdbfkk8KuQHeRSn13r3aF+NR3W9wxz6vfLesy
 /mDu/1bLJ3YUdmj2LmExs6pISsG1s47LfSiuy+4ddiHxS9aw/oBBLJP6yeN5A3XLwFXK
 HkWad1JArlr6rcGP/BCIf7ZKM8KaHS36eVMEUDOYMVkpVLhTlOQuUv5B6ZmjRsjCFKh0
 nzNtueQRoo2IcjnUqVTGlrDbb/WK76VTGy6UcL6Ium5AfTdbvuoc1lu3fliWDrMbDQQu
 V6f/XZMJxxR2A+4WfUDkSjdN/6gEwCD+/S/c37AHavdnXAnjXKgGxMKZcSBY7oM17IX6 wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39xg2c0844-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 11:05:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 842EA10002A;
 Wed, 21 Jul 2021 11:05:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CB1C21B52A;
 Wed, 21 Jul 2021 11:05:52 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 21 Jul
 2021 11:05:51 +0200
To: Simon Glass <sjg@chromium.org>
References: <20210720203353.1.I550b95f6d12d59aeef5b744d837dbb360037d39e@changeid>
 <CAPnjgZ1Pm5EnOqGw29LpEM9bKEefR2rO5-dT0++F6OSsUQyvsQ@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <454d3edb-dfc6-80c2-7265-58c42354b4f3@foss.st.com>
Date: Wed, 21 Jul 2021 11:05:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ1Pm5EnOqGw29LpEM9bKEefR2rO5-dT0++F6OSsUQyvsQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_04:2021-07-21,
 2021-07-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [Uboot-stm32] [PATCH] build: remove the variable NM in
 gen_ll_addressable_symbols.sh
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

Ck9uIDcvMjAvMjEgODo1MCBQTSwgU2ltb24gR2xhc3Mgd3JvdGU6Cj4gSGkgUGF0cmljaywKPgo+
IE9uIFR1ZSwgMjAgSnVsIDIwMjEgYXQgMTI6MzQsIFBhdHJpY2sgRGVsYXVuYXkKPiA8cGF0cmlj
ay5kZWxhdW5heUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+IFdpdGggTFRPIGFjdGl2YXRlZCwgdGhl
IGJ1aWxkbWFuIHRvb2xzIGZhaWxlZCB3aXRoIGFuIGVycm9yIG9uIG15Cj4+IGNvbmZpZ3VyYXRp
b24gKFVidW50dSAyMC4wNCwgc3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnKSB3aXRoIHRoZSBl
cnJvcjoKPj4KPj4gLi4vYXJtLWxpbnV4LWdudWVhYmkvYmluL25tOgo+PiAgICAgICAgICBzY3Jp
cHRzL2dlbl9sbF9hZGRyZXNzYWJsZV9zeW1ib2xzLnNoOiBmaWxlIGZvcm1hdCBub3QgcmVjb2du
aXplZAo+Pgo+PiBJdCBzZWVtcyB0aGUgc2hlbGwgdmFyaWFibGUgaW5pdGlhbGl6YXRpb24gTk09
JChOTSkgaXMgbm90IGNvcnJlY3RseQo+PiBpbnRlcnByZXRlZCB3aGVuIHNoZWxsIGlzIHN0YXJ0
ZWQgaW4gdGhlIE1ha2VmaWxlLCBidXQgSSBoYXZlIG5vdCB0aGlzCj4+IGlzc3VlIHdoZW4gSSBj
b21waWxlIHRoZSBzYW1lIHRhcmdldCB3aXRob3V0IGJ1aWxkbWFuLgo+Pgo+PiBJIGRvbid0IGZv
dW5kIHRoZSByb290IHJlYXNvbiBvZiB0aGUgcHJvYmxlbSBidXQgSSBzb2x2ZSBpdCBieQo+PiBw
cm92aWRpbmcgJChOTSkgYXMgc2NyaXB0IHBhcmFtZXRlciBpbnN0ZWFkIHVzaW5nIGEgc2hlbGwg
dmFyaWFibGUuCj4+Cj4+IFRoZSBjb21tYW5kIGV4ZWN1dGVkIGlzIGlkZW50aWNhbDoKPj4KPj4g
Y21kX2tlZXAtc3ltcy1sdG8uYyA6PSBOTT1hcm0tbm9uZS1saW51eC1nbnVlYWJpaGYtZ2NjLW5t
IFwKPj4gdS1ib290L3NjcmlwdHMvZ2VuX2xsX2FkZHJlc3NhYmxlX3N5bWJvbHMuc2ggYXJjaC9h
cm0vY3B1L2J1aWx0LWluLm8gXAo+PiAuLi4uIG5ldC9idWlsdC1pbi5vID5rZWVwLXN5bXMtbHRv
LmMKPj4KPj4gY21kX2tlZXAtc3ltcy1sdG8uYyA6PSB1LWJvb3Qvc2NyaXB0cy9nZW5fbGxfYWRk
cmVzc2FibGVfc3ltYm9scy5zaCBcCj4+IGFybS1ub25lLWxpbnV4LWdudWVhYmloZi1nY2Mtbm0g
YXJjaC9hcm0vY3B1L2J1aWx0LWluLm8gXAo+PiAuLi4gbmV0L2J1aWx0LWluLm8gPiBrZWVwLXN5
bXMtbHRvLmMKPj4KPj4gU2VyaWUtY2M6IE1hcmVrIEJlaMO6biA8bWFyZWsuYmVodW5AbmljLmN6
Pgo+PiBTZXJpZS1jYzogc2pnCj4gU2VyaWVzLWNjCgp0aGFua3MsIEkgUkVTRU5EIHRoZSBwYXRj
aCB3aXRoIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UuLi4uCgpJIG1hZGUgdGhlIHNhbWUgZXJyb3Ig
KFNlcmllIHZzIFNlcmllcykuLi4KCkFnYWluICEKCkJlc3QgUmVnYXJkcwoKUGF0cmljawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIg
bWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qt
c3RtMzIK
