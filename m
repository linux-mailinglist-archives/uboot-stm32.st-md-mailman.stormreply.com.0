Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C2F40F65C
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Sep 2021 12:56:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A8B7C597BC;
	Fri, 17 Sep 2021 10:56:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83D98C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Sep 2021 10:56:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18H8uR4b007331; 
 Fri, 17 Sep 2021 12:56:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sU0HhjX+g1m4RcnixVBWo7sYTH//9FYqz7WLBIvOpZc=;
 b=CCrCswlZgd/Yjw8CmTDw6HRbrYzCKoucqdppRei+v520AxjW5xpGLy5XBbrRt53YyYGO
 qPwfFqP+u1onQKQtNNcGm5okMpPzKA6Lg4uc6Edyiped/san4Ini//0CjsD+pNf7an3+
 LMbdrGHYdhf1phNf5lUCiFqDEhS418REC5dMsYvEtEDmaEvb8qfXMrSoUUGLG6OLIR8Q
 eUzjmaA059Xb3eVxCO2okQYTT/07V9pCa6g1IpJDI0Sr8RpYbMhUv2qrKwY5WKmJauuZ
 uN8lxNmeYnpxf1kuHWoRKyepPM8Sdsgzh0n79RV4mZ1e6FJ993/pyb+SEQjl6NEDRDNn xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b4j29tjt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 12:56:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3984C10002A;
 Fri, 17 Sep 2021 12:56:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17DDC233C77;
 Fri, 17 Sep 2021 12:56:01 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 17 Sep
 2021 12:56:00 +0200
To: <u-boot@lists.denx.de>
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
 <20210916155040.v3.1.I81b4f1edfe925b001299e3b7ba0cf602d9268d59@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <70b0c139-b384-a2b9-91b1-7addc084eaa1@foss.st.com>
Date: Fri, 17 Sep 2021 12:55:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916155040.v3.1.I81b4f1edfe925b001299e3b7ba0cf602d9268d59@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-17_04,2021-09-16_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
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

SGkgTWFyZWssCgogPiBNYXJlayBWYXN1dFNlcHQuIDE2LCAyMDIxLCA1OjI0IHAubS4gVVRDIHwg
IzEKCiA+IE9uIDkvMTYvMjEgNDowMSBQTSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKCiA+PiBX
aGVuIENPTkZJR19TWVNfTUFYX0ZMQVNIX0JBTktTX0RFVEVDVCBpcyBhY3RpdmF0ZWQsCiA+PiBD
T05GSUdfU1lTX01BWF9GTEFTSF9CQU5LUyBpcyByZXBsYWNlZCBieSBjZmlfZmxhc2hfbnVtX2Zs
YXNoX2JhbmtzLAogPj4gYnV0IHRoaXMgdmFyaWFibGUgaXMgZGVmaW5lZCBpbiBkcml2ZXJzL210
ZC9jZmlfZmxhc2guYywgd2hpY2ggaXMKID4+IGNvbXBpbGVkIG9ubHkgd2hlbiBDT05GSUdfRkxB
U0hfQ0ZJX0RSSVZFUiBpcyBhY3RpdmF0ZWQsIGluIFUtQm9vdAogPj4gb3IgaW4gU1BMIHdoZW4g
Q09ORklHX1NQTF9NVERfU1VQUE9SVCBpcyBhY3RpdmF0ZWQuCiA+PgogPj4gVGhpcyBwYXRjaCBk
ZWFjdGl2YXRlcyB0aGlzIGZlYXR1cmUgQ09ORklHX1NZU19NQVhfRkxBU0hfQkFOS1NfREVURUNU
CiA+PiB3aGVuIGZsYXNoIGNmaSBkcml2ZXIgaXMgbm90IGFjdGl2YXRlZCB0byBhdm9pZCBjb21w
aWxhdGlvbiBpc3N1ZSBpbgogPj4gdGhlIG5leHQgcGF0Y2gsIHdoZW4gQ09ORklHX1NZU19NQVhf
RkxBU0hfQkFOS1MgaXMgdXNlZCBpbiAKc3BpX25vcl9zY2FuKCkuCgogPiBNYXliZSBqdXN0IG1p
Z3JhdGUgdGhpcyBjb25maWcgb3B0aW9uIHRvIEtjb25maWcgYW5kIGxldCBLY29uZmlnIGhhbmRs
ZQogPiB0aGUgbWFjcm8gbWFnaWMgPwoKClNvcnJ5IGZvciB0aGUgZm9ybWF0wqAgb2YgbXkgYW5z
d2VyIChpdCBpcyBqdXN0IGNvcHkgcGFzdGUgZnJvbSBhcmNoaXZlKQoKYmVjYXVzZSBJIGRvbid0
IHJlY2VpdmVkIHRoZSBVLUJvb3QgbWFpbHMgb24gbXkgQGZvc3Muc3QuY29tIG1haWxibwoKc2lu
Y2UgeWVzdGVyZGF5LgoKCkkgdGhpbmsgYWJvdXQgbWlncmF0aW9uIGJ1dCBpcyBkaWZmaWN1bHQg
dG8gZG9uJ3QgYnJlYWsgdGhlIGV4aXN0aW5nIApiZWhhdmlvdXIgaW4ga2NvbmZpZwoKQ09ORklH
X1NZU19NQVhfRkxBU0hfQkFOS1MgYW5kIENPTkZJR19TWVNfTUFYX0ZMQVNIX0JBTktTX0RFVEVD
VCBhcmUgCmRlZmluZSBhcyAnaW50JwoKYnV0IGNhbiBiZSBhYnNlbnQgPT4gMiBuZXcgY29uZmln
IENPTkZJR19VU0UgbmVlZCB0byBiZSBhZGRlZAoKQ09ORklHX1VTRV9TWVNfTUFYX0ZMQVNIX0JB
TktTCgpDT05GSUdfVVNFX1NZU19NQVhfRkxBU0hfQkFOS1NfREVURUNUCgoKYW5kIEkgZG9uJ3Qg
ZnVsbHkgdW5kZXJzdG9vZCB0aGUgbWl4IGJldHdlZW4gdGhlIDIgb3B0aW9ucyBhbmQgCkNGSV9N
QVhfRkxBU0hfQkFOS1MKCmluIHNvbWUgcGFydCBvZiBjb2RlIEkgdGhpbmsgQ09ORklHX1NZU19N
QVhfRkxBU0hfQkFOS1Mgc2hvdWxkIGJlIApyZXBsYWNlZCBieSBDRklfTUFYX0ZMQVNIX0JBTktT
Cgp0byBhdm9pZCB0byBkZWZpbmUgQ09ORklHX1NZU19NQVhfRkxBU0hfQkFOS1MgPSAKY2ZpX2Zs
YXNoX251bV9mbGFzaF9iYW5rcyAoYXMgaXQgaXMgbm90IHBvc3NpYmxlIGluIEtjb25maWcpCgoK
PT4gdG9vIGh1Z2UgdGFzayBqdXN0IHRvIHNvbHZlIGNvbXBpbGF0aW9uIGlzc3Vlcy4KCgphbmQg
SSBhbHNvIHRoaW5rIHRvIHVzZSBDT05GSUdfSVNfRU5BQkxFRChNVERfU1VQUE9SVCkKCmJ1dCBp
dCBub3QgcG9zc2libGUgYmVjYXVzZSB0b2RheQoKLSBDT05GSUdfU1BMX01URF9TVVBQT1JUIGV4
aXN0CgotIENPTkZJR19NVERfU1VQUE9SVCBkb24ndCBleGl0ICggdGVzdCBvbiAkKG10ZC15KSBp
biBNYWtlZmlsZSkKCgo9PiB0aGUgY3JlYXRpb24gb2YgdGhpcyBjb25maWcgaXMgYSBodWdlIHRh
c2sganVzdCB0byBzb2x2ZSBjb21waWxhdGlvbiAKaXNzdWUuCgoKUGF0cmljawoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
