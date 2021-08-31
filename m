Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EBB3FCB85
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Aug 2021 18:30:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 618FAC57B60;
	Tue, 31 Aug 2021 16:30:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C5EBC5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 16:30:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17VFfTvg012312;
 Tue, 31 Aug 2021 18:30:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Q8oOjAXa/c8Vlb0jNBsj5LHDYxYT7LSXlwh1gY8oVVA=;
 b=4tcCgZrm0XHwaioqL5xNwIe70n9ABAtUAIKXZ5dfGSpYC/vydfJmmiYsirqZRoHuI3Qo
 s14LY6of+xNT32VxbNoYUOb4qCLK+ht/OwyDY5EFbxaS8xHs1g8sePmJenY1G2b4L4Sj
 W2B9JhvPoXVL6FXZkU6rs1bvFDzMQwsnCKS+QFFEjgrHKNGIdE9IAUQFrltCvA1bGy3v
 0B2rpHK1r4AvvN8eGqmKUl9aBv4AK3nK5t/1SQYJ/+inlk0Z/OGuEAcZXgLikiAJev5s
 IHOzJyCm61H/07kP9pKTn2DF3u5EOa/6R4/oImMGYSq8eZhGFVcJII4WIGiJI9mB2DYc LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3asc7e4774-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 18:30:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 161E510002A;
 Tue, 31 Aug 2021 18:30:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 093EA2552A4;
 Tue, 31 Aug 2021 18:30:09 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 18:30:07 +0200
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, <u-boot@lists.denx.de>
References: <20210826214209.254461-1-mr.nuke.me@gmail.com>
 <20210826214209.254461-3-mr.nuke.me@gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <2e118988-b0fe-c0c9-1766-ac1353ece55c@foss.st.com>
Date: Tue, 31 Aug 2021 18:30:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826214209.254461-3-mr.nuke.me@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_07,2021-08-31_01,2020-04-07_01
Cc: marex@denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 02/10] stm32mp1: Add support for falcon
 mode boot from SD card
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

SGksCgpBZGQgaW4gQ0MgdGhlIE1BSU5UQUlORVJTCgpPbiA4LzI2LzIxIDExOjQyIFBNLCBBbGV4
YW5kcnUgR2Fnbml1YyB3cm90ZToKPiBGYWxjb24gbW9kZSByZXF1aXJlcyBhIGJvYXJkLXNwZWNp
ZmljIG1lY2hhbmlzbSB0byBzZWxlY3QgYmV0d2Vlbgo+IGZhc3QgYW5kIG5vcm1hbCBib290LiBU
aGlzIGlzIGRvbmUgdmlhIHNwbF9zdGFydF91Ym9vdCgpCj4KPiBVc2UgdGhlIEIyIGJ1dHRvbiBh
cyB0aGUgc2VsZWN0aW9uIG1lY2hhbmlzbS4gVGhpcyBpcyBjb25uZWN0ZWQgdG8KPiBHUElPIFBB
MTMuIEluY2lkZW50YWxseSwgdGhpcyBHUElPIGlzIGFscmVhZHkgYWNjZXNzaWJsZSB2aWEgdGhl
Cj4gInN0LGZhc3Rib290LWdwaW9zIiBkZXZpY2V0cmVlIG5vZGUuCj4KPiBPZmZzZXRzIGZvciBy
YXcgTU1DIGxvYWRpbmcgYXJlIGRlZmluZWQuIFRoZXNlIHBvaW50IHRvIHRoZSBwYXJ0aXRpb24K
PiBhZnRlciAic3NibCIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgR2Fnbml1YyA8bXIu
bnVrZS5tZUBnbWFpbC5jb20+Cj4gLS0tCj4gICBib2FyZC9zdC9zdG0zMm1wMS9zcGwuYyAgICB8
IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBpbmNsdWRlL2Nv
bmZpZ3Mvc3RtMzJtcDEuaCB8IDEzICsrKysrKysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwg
NTIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2JvYXJkL3N0L3N0bTMybXAxL3NwbC5j
IGIvYm9hcmQvc3Qvc3RtMzJtcDEvc3BsLmMKPiBpbmRleCA4ZTQ1NDlhMWIzLi5iYjIxMGQ3NzI3
IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3N0L3N0bTMybXAxL3NwbC5jCj4gKysrIGIvYm9hcmQvc3Qv
c3RtMzJtcDEvc3BsLmMKPiBAQCAtOCw2ICs4LDcgQEAKPiAgICNpbmNsdWRlIDxpbml0Lmg+Cj4g
ICAjaW5jbHVkZSA8YXNtL2lvLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2FyY2gvc3lzX3Byb3RvLmg+
Cj4gKyNpbmNsdWRlIDxhc20vZ3Bpby5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPgo+
ICAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gICAjaW5jbHVkZSAiLi4vY29tbW9uL3N0cG1p
YzEuaCIKPiBAQCAtMjksNiArMzAsNDQgQEAgaW50IGJvYXJkX2Vhcmx5X2luaXRfZih2b2lkKQo+
ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19TUExfT1Nf
Qk9PVCkKPiAraW50IHNwbF9zdGFydF91Ym9vdCh2b2lkKQo+ICt7Cj4gKwlvZm5vZGUgbm9kZTsK
PiArCXN0cnVjdCBncGlvX2Rlc2MgZ3BpbzsKPiArCWludCBib290X3Vib290ID0gMTsKPiArCj4g
Kwlub2RlID0gb2Zub2RlX3BhdGgoIi9jb25maWciKTsKPiArCWlmICghb2Zub2RlX3ZhbGlkKG5v
ZGUpKSB7Cj4gKwkJcHJfd2FybigiJXM6IG5vIC9jb25maWcgbm9kZT9cbiIsIF9fZnVuY19fKTsK
PiArCQlyZXR1cm4gMDsKPiArCX0KPiArCj4gKwlpZiAoZ3Bpb19yZXF1ZXN0X2J5X25hbWVfbm9k
ZXYobm9kZSwgInN0LGZhc3Rib290LWdwaW9zIiwgMCwgJmdwaW8sCj4gKwkJCQkgICAgICAgR1BJ
T0RfSVNfSU4pKSB7Cj4gKwkJcHJfd2FybigiJXM6IGNvdWxkIG5vdCBmaW5kIGEgL2NvbmZpZy9z
dCxmYXN0Ym9vdC1ncGlvc1xuIiwKPiArCQkJX19mdW5jX18pOwo+ICsJCXJldHVybiAxOwo+ICsJ
fQoKVGhlIG5vZGUgInN0LGZhc3Rib290LWdwaW9zIiBpcyB1c2VkIGluIFNUTWljcm9lbGVjdHJv
bmljcyBkZXZpY2V0cmVlIC8gYm9hcmQKdG8gc2VsZWN0IHRoZSBLRVkgdG8gbGF1bmNoIHRoZSBB
TkRST0lEIGNvbW1hbmQgZmFzdGJvb3QgaW4gYm9hcmRfa2V5X2NoZWNrKCkKCj0+IGl0IGNhbid0
IGJlIHJlLXVzZWQgdG8gb3RoZXIgcHVycG9zZSBlbHNlIHlvdSB3aWxsIGhhdmUgY29uZmxpY3Qg
d2hlbiB0aGUga2V5CiAgICBpcyBwcmVzc2VkOgogICAgCiAgICB3aGF0IGFwcGVuZCB3aGVuIGtl
eSBwcmVzc2VkIGluIGJhc2ljIGJvb3QgbW9kZSB3aGVuIEtFWSBpcyBwcmVzc2VkID8KICAgID0+
IGZhbGNvbiBtb2RlIHNlbGVjdGVkIGluIFNQTCBvciBGQVNUQk9PVCBtb2RlIHNlbGVjdGVkIC4u
Li4KCiJzdCxmYXN0Ym9vdC1ncGlvcyIgbWVhbmluZyBpcyBkZWZpbmVkIGluOgoKaHR0cHM6Ly93
aWtpLnN0LmNvbS9zdG0zMm1wdS93aWtpL0hvd190b19jb25maWd1cmVfVS1Cb290X2Zvcl95b3Vy
X2JvYXJkI0NvbmZpZ19ub2RlCgp5b3Ugc2hvdWxkIHVzZSBhIG90aGVyIGNvbmZpZyA/Cj0+ICJt
cm51a2UsZmFsY29uLWdwaW9zIiBtYW5hZ2VkIGluIHlvdXIgYm9hcmQgLmMgZmlsZSAvIGR0cyBm
aWxlCgpvciBoYXJkY29kZWQgaW4geW91ciBib2FyZC5jID8KCm9yIHVzZSBlbnZpcm9ubWVudC4u
Li4KaWYgKGVudl9nZXRfeWVzbm8oImJvb3Rfb3MiKSAhPSAwKQoKPiArCj4gKwlib290X3Vib290
ID0gZG1fZ3Bpb19nZXRfdmFsdWUoJmdwaW8pOwo+ICsJZG1fZ3Bpb19mcmVlKE5VTEwsICZncGlv
KTsKPiArCj4gKwlyZXR1cm4gYm9vdF91Ym9vdDsKPiArfQo+ICsKPiArI2lmIElTX0VOQUJMRUQo
Q09ORklHX0FSTVY3X05PTlNFQykKPiArLyoKPiArICogQSBiaXQgb2YgYSBoYWNrLCBidXQgYXJt
djdfYm9vdF9ub25zZWMoKSBpcyBwcm92aWRlZCBieSBib290bS5jLiBUaGlzIGlzIG5vdAo+ICsg
KiBhdmFpbGFibGUgaW4gU1BMLCBzbyB3ZSBoYXZlIHRvIHByb3ZpZGUgYW4gaW1wbGVtZW50YXRp
b24uCj4gKyAqLwo+ICtib29sIGFybXY3X2Jvb3Rfbm9uc2VjKHZvaWQpCj4gK3sKPiArCXJldHVy
biAwOwo+ICt9Cj4gKyNlbmRpZiAvKiBDT05GSUdfQVJNVjdfTk9OU0VDICovCj4gKyNlbmRpZiAv
KiBDT05GSUdfU1BMX09TX0JPT1QgKi8KPiArCj4gICAjaWZkZWYgQ09ORklHX0RFQlVHX1VBUlRf
Qk9BUkRfSU5JVAo+ICAgdm9pZCBib2FyZF9kZWJ1Z191YXJ0X2luaXQodm9pZCkKPiAgIHsKPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9jb25maWdzL3N0bTMybXAxLmggYi9pbmNsdWRlL2NvbmZpZ3Mv
c3RtMzJtcDEuaAo+IGluZGV4IDlmY2Q2MDI4NWEuLjA4NDlhMWJkZGIgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9jb25maWdzL3N0bTMybXAxLmgKPiArKysgYi9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJt
cDEuaAo+IEBAIC0xMCw2ICsxMCwxOSBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+Cj4g
ICAjaW5jbHVkZSA8YXNtL2FyY2gvc3RtMzIuaD4KPiAgIAo+ICsvKgo+ICsgKiBBcmd1bWVudHMg
aWYgZmFsY29uIG1vZGUgaXMgdXNlZAo+ICsgKiBDT05GSUdfU1lTX01NQ1NEX1JBV19NT0RFX0tF
Uk5FTF9TRUNUT1IgaXMgdGhlIHBhcnRpdGlvbiBhZnRlciAic3NibCIKPiArICogQ09ORklHX1NZ
U19TUExfQVJHU19BRERSIGlzIG5vdCB1c2VkLCBidXQgbmVlZHMgdG8gcG9pbnQgdG8gdmFsaWQg
UkFNLgo+ICsgKi8KPiArI2RlZmluZSBDT05GSUdfU1lTX01NQ1NEX1JBV19NT0RFX0tFUk5FTF9T
RUNUT1IgNTE1NAoKVGhlIG9mZnNldCBvZiBrZXJuZWwgaXMgaGFyZGNvZGVkCgo9PiBpdCBpcyBu
b3QgYWNjZXB0YWJsZSBoZXJlIChnZW5lcmljIHN0bTMybXAxIGZpbGUpCgo+ICsjZGVmaW5lIENP
TkZJR19TWVNfU1BMX0FSR1NfQUREUiAweGM0MDAwMDAwCj4gKwo+ICsvKiBGYWxjb24gbW9kZSBm
cm9tIFNQSSBpcyBub3Qgc3VwcG9ydGVkLCBidXQgdGhlIGRlZmluZXMgYXJlIG5lZWRlZCAqLwo+
ICsjZGVmaW5lIENPTkZJR19TWVNfU1BJX0tFUk5FTF9PRkZTCSh+MCkKPiArI2RlZmluZSBDT05G
SUdfU1lTX1NQSV9BUkdTX09GRlMJKH4wKQo+ICsjZGVmaW5lIENPTkZJR19TWVNfU1BJX0FSR1Nf
U0laRQkwCj4gKwoKRmFsY29uIG1vZGUgaXMgbm90IHN1cHBvcnRlZCBieSBTVCBNaWNyb2VsZWN0
cm9uaWNzCmFuZCB0aGlzIGZpbGUgaXMgZXhwZWN0ZWQgdG8gc3VwcG9ydCB0aGUgU1QgYm9hcmRz
IChib2FyZC9zdC9zdG0zMm1wMSkKCj0+IHRoZXNlIGRlZmluZXMgc2hvdWxkIGJlIGluIHlvdXIg
Y29uZmlndXJhdGlvbiBub3QgaW4gdGhlIEdFTkVSSUMgc3RtMzJtcDEgZmlsZXMKCmZvciBleGFt
cGxlIGluCgppbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDE1X2ZhbGNvbi5oCgojaW5jbHVkZSAic3Rt
MzJtcDEuaCIKCi4uLi4KCndpdGggQ09ORklHX1NZU19DT05GSUdfTkFNRSA9wqAgInN0bTMybXAx
NV9mYWxjb24iIGluIHlvdXIgS2NvbmZpZwoKCj4gICAjaWZuZGVmIENPTkZJR19URkFCT09UCj4g
ICAvKiBQU0NJIHN1cHBvcnQgKi8KPiAgICNkZWZpbmUgQ09ORklHX0FSTVY3X1NFQ1VSRV9CQVNF
CQlTVE0zMl9TWVNSQU1fQkFTRQoKClBhdHJpY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
