Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 416BE41336A
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Sep 2021 14:38:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8285C5A4CD;
	Tue, 21 Sep 2021 12:38:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBBD6C5A4CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 12:38:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L7AJjp006192; 
 Tue, 21 Sep 2021 14:38:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DKmaV/1wqbWrxnfgFWRmEGs6Gk9/piymIsKAtB1BwPQ=;
 b=sFyrgCMaNjO5b7rf9DAXC1D9o9hApZMMqiUVWu1nEtMDJOnYEgEkaK1Xeccpw3N+dVmW
 zotna67FY3+jm+WirN7sfEGBlhNqKZUP1xFLbBMmlgIZqQEHAihNWRx27wh0h85lxe3H
 g/ygP4cr8OwOW2DJZREywU1B1DbDCeT2CQWo9ViQH/YgvCURCp5grHMY5MSP+kjfRtsM
 3lofIfX+LkLR9RDuCD61wB4tBbTR5Dp9nh92cTOoL9wVfyud1fbSjzd4hiyJ0BRvBRiF
 2lcqWoolawL5oBiRmlpoy1zLuQF4ChkaxYCDla81G9/ElqgjA54NS4+OO+9D11yCjRLN WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b7as51k4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 14:38:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8EA7A10002A;
 Tue, 21 Sep 2021 14:38:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56557237D82;
 Tue, 21 Sep 2021 14:38:31 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 14:38:30 +0200
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
 <20210916155040.v3.1.I81b4f1edfe925b001299e3b7ba0cf602d9268d59@changeid>
 <70b0c139-b384-a2b9-91b1-7addc084eaa1@foss.st.com>
 <34d4bdb8-6d26-f7df-fa15-6aa986343f14@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <74486cb8-3646-17be-161a-c6e834c0c588@foss.st.com>
Date: Tue, 21 Sep 2021 14:38:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <34d4bdb8-6d26-f7df-fa15-6aa986343f14@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
Cc: Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/2] mtd: cfi_flash: use
 cfi_flash_num_flash_banks only when supported
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

SGksCgpPbiA5LzE3LzIxIDM6MzYgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDkvMTcvMjEg
MTI6NTUgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+IEhpIE1hcmVrLAo+Pgo+PiDCoD4g
TWFyZWsgVmFzdXRTZXB0LiAxNiwgMjAyMSwgNToyNCBwLm0uIFVUQyB8ICMxCj4+Cj4+IMKgPiBP
biA5LzE2LzIxIDQ6MDEgUE0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+Cj4+IMKgPj4gV2hl
biBDT05GSUdfU1lTX01BWF9GTEFTSF9CQU5LU19ERVRFQ1QgaXMgYWN0aXZhdGVkLAo+PiDCoD4+
IENPTkZJR19TWVNfTUFYX0ZMQVNIX0JBTktTIGlzIHJlcGxhY2VkIGJ5IGNmaV9mbGFzaF9udW1f
Zmxhc2hfYmFua3MsCj4+IMKgPj4gYnV0IHRoaXMgdmFyaWFibGUgaXMgZGVmaW5lZCBpbiBkcml2
ZXJzL210ZC9jZmlfZmxhc2guYywgd2hpY2ggaXMKPj4gwqA+PiBjb21waWxlZCBvbmx5IHdoZW4g
Q09ORklHX0ZMQVNIX0NGSV9EUklWRVIgaXMgYWN0aXZhdGVkLCBpbiBVLUJvb3QKPj4gwqA+PiBv
ciBpbiBTUEwgd2hlbiBDT05GSUdfU1BMX01URF9TVVBQT1JUIGlzIGFjdGl2YXRlZC4KPj4gwqA+
Pgo+PiDCoD4+IFRoaXMgcGF0Y2ggZGVhY3RpdmF0ZXMgdGhpcyBmZWF0dXJlIAo+PiBDT05GSUdf
U1lTX01BWF9GTEFTSF9CQU5LU19ERVRFQ1QKPj4gwqA+PiB3aGVuIGZsYXNoIGNmaSBkcml2ZXIg
aXMgbm90IGFjdGl2YXRlZCB0byBhdm9pZCBjb21waWxhdGlvbiBpc3N1ZSBpbgo+PiDCoD4+IHRo
ZSBuZXh0IHBhdGNoLCB3aGVuIENPTkZJR19TWVNfTUFYX0ZMQVNIX0JBTktTIGlzIHVzZWQgaW4g
Cj4+IHNwaV9ub3Jfc2NhbigpLgo+Pgo+PiDCoD4gTWF5YmUganVzdCBtaWdyYXRlIHRoaXMgY29u
ZmlnIG9wdGlvbiB0byBLY29uZmlnIGFuZCBsZXQgS2NvbmZpZyAKPj4gaGFuZGxlCj4+IMKgPiB0
aGUgbWFjcm8gbWFnaWMgPwo+Pgo+Pgo+PiBTb3JyeSBmb3IgdGhlIGZvcm1hdMKgIG9mIG15IGFu
c3dlciAoaXQgaXMganVzdCBjb3B5IHBhc3RlIGZyb20gYXJjaGl2ZSkKPj4KPj4gYmVjYXVzZSBJ
IGRvbid0IHJlY2VpdmVkIHRoZSBVLUJvb3QgbWFpbHMgb24gbXkgQGZvc3Muc3QuY29tIG1haWxi
bwo+Pgo+PiBzaW5jZSB5ZXN0ZXJkYXkuCj4+Cj4+Cj4+IEkgdGhpbmsgYWJvdXQgbWlncmF0aW9u
IGJ1dCBpcyBkaWZmaWN1bHQgdG8gZG9uJ3QgYnJlYWsgdGhlIGV4aXN0aW5nIAo+PiBiZWhhdmlv
dXIgaW4ga2NvbmZpZwo+Pgo+PiBDT05GSUdfU1lTX01BWF9GTEFTSF9CQU5LUyBhbmQgQ09ORklH
X1NZU19NQVhfRkxBU0hfQkFOS1NfREVURUNUIGFyZSAKPj4gZGVmaW5lIGFzICdpbnQnCj4+Cj4+
IGJ1dCBjYW4gYmUgYWJzZW50ID0+IDIgbmV3IGNvbmZpZyBDT05GSUdfVVNFIG5lZWQgdG8gYmUg
YWRkZWQKPj4KPj4gQ09ORklHX1VTRV9TWVNfTUFYX0ZMQVNIX0JBTktTCj4+Cj4+IENPTkZJR19V
U0VfU1lTX01BWF9GTEFTSF9CQU5LU19ERVRFQ1QKPj4KPj4KPj4gYW5kIEkgZG9uJ3QgZnVsbHkg
dW5kZXJzdG9vZCB0aGUgbWl4IGJldHdlZW4gdGhlIDIgb3B0aW9ucyBhbmQgCj4+IENGSV9NQVhf
RkxBU0hfQkFOS1MKPj4KPj4gaW4gc29tZSBwYXJ0IG9mIGNvZGUgSSB0aGluayBDT05GSUdfU1lT
X01BWF9GTEFTSF9CQU5LUyBzaG91bGQgYmUgCj4+IHJlcGxhY2VkIGJ5IENGSV9NQVhfRkxBU0hf
QkFOS1MKPj4KPj4gdG8gYXZvaWQgdG8gZGVmaW5lIENPTkZJR19TWVNfTUFYX0ZMQVNIX0JBTktT
ID0gCj4+IGNmaV9mbGFzaF9udW1fZmxhc2hfYmFua3MgKGFzIGl0IGlzIG5vdCBwb3NzaWJsZSBp
biBLY29uZmlnKQo+Pgo+Pgo+PiA9PiB0b28gaHVnZSB0YXNrIGp1c3QgdG8gc29sdmUgY29tcGls
YXRpb24gaXNzdWVzLgo+Pgo+Pgo+PiBhbmQgSSBhbHNvIHRoaW5rIHRvIHVzZSBDT05GSUdfSVNf
RU5BQkxFRChNVERfU1VQUE9SVCkKPj4KPj4gYnV0IGl0IG5vdCBwb3NzaWJsZSBiZWNhdXNlIHRv
ZGF5Cj4+Cj4+IC0gQ09ORklHX1NQTF9NVERfU1VQUE9SVCBleGlzdAo+Pgo+PiAtIENPTkZJR19N
VERfU1VQUE9SVCBkb24ndCBleGl0ICggdGVzdCBvbiAkKG10ZC15KSBpbiBNYWtlZmlsZSkKPj4K
Pj4KPj4gPT4gdGhlIGNyZWF0aW9uIG9mIHRoaXMgY29uZmlnIGlzIGEgaHVnZSB0YXNrIGp1c3Qg
dG8gc29sdmUgCj4+IGNvbXBpbGF0aW9uIGlzc3VlLgo+Cj4gQWxsIHJpZ2h0LCB3ZWxsLCBldy4K
Pgo+IENhbiB5b3Ugc2VuZCBhIHN1YnNlcXVlbnQgcGF0Y2hzZXQgX2FmdGVyXyB0aGlzIG9uZSB0
byBmaXggdGhpcyBmbGFzaCAKPiBiYW5rcyBtZXNzID8KCgpJIGNhbiB0cnksCgpJIHdpbGwgYWRk
IGl0IGluIG15IFRPRE8gbGlzdC4KCgpQYXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
